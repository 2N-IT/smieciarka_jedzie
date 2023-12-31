class PostsController < AuthenticatedController

  def index

  end

  def new
    post = current_user.posts.new

    render 'posts/new', locals: { post: post }
  end

  def attach_image
    post = Posts::AttachImage.new(params: params, current_user: current_user).call
    respond_to do |format|
      format.turbo_stream do
        render 'posts/attach_image', locals: { post: post }
      end
    end
  end

  def publish_post
    post = current_user.posts.find(params[:post][:id])
    params[:post][:tags]&.each do |id, value|
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
