class PostsController < AuthenticatedController

  def index

  end
  def new
    post = current_user.posts.new

    render 'posts/new', locals: { post: post }
  end

  def create

  end
end
