class PostsController < AuthenticatedController

  def index

  end

  def new
    post = current_user.posts.new

    render 'posts/new', locals: { post: post }
  end

  def attach_image
    post = current_user.posts.create!
    post.image.attach(params[:post][:image])
    respond_to do |format|
      format.turbo_stream do
        render 'posts/attach_image', locals: { post: post }
      end
    end
  end

  def publish_post
    sleep(10)
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
