class PostsController < AuthenticatedController

  def index

  end
  def new
    post = current_user.posts.new

    render 'posts/new', locals: { post: post }
  end

  def attach_image
    sleep(10)
  end

  def publish_post
    sleep(10)
  end
end
