class PostsController < AuthenticatedController

  def index

  end

  def new
    post = current_user.posts.new

    render 'posts/new', locals: { post: post }
  end

  def attach_image
    image = File.open(params[:post][:image].tempfile, 'rb') { |file| file.read }
    tags = Api::Rekognition.new(image: image).call
    chat_response = Api::ChatGpt.new(message: tags.join(', ')).call
    body = chat_response['choices'].first['message']['content']
    post = current_user.posts.create!(body: body)
    post.image.attach(params[:post][:image])
    respond_to do |format|
      format.turbo_stream do
        render 'posts/attach_image', locals: { post: post }
      end
    end
  end

  def publish_post
    post = current_user.posts.find(params[:post][:id])
    params[:post][:tags].each do |id, value|
      next unless value == '1'
      tag = Tag.find(id)
      post.tags << tag
    end
    flash[:notice] = 'Post został opublikowany'
    redirect_to post_post_published_path(params[:post][:id])
  end

  def post_published
    post = Post.find(params[:post_id])
    render 'posts/post_published', locals: { post: post }
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
