class PostsController < AuthenticatedController

  def index

  end

  def new
    post = current_user.posts.new

    render 'posts/new', locals: { post: post }
  end

  def attach_image
    post = current_user.posts.create!(body: "Cześć wszystkim! 🎉 Mam do oddania za darmo parę butów narciarskich [rozmiar]. Są to buty do narciarstwa zjazdowego, idealne dla miłośników sportów zimowych. Jeśli ktoś jest zainteresowany, proszę dajcie znać. Uwaga: oddaję tylko osobie, która naprawdę tego potrzebuje. 🎿🏔️")
    post.image.attach(params[:post][:image])
    respond_to do |format|
      format.turbo_stream do
        render 'posts/attach_image', locals: { post: post }
      end
    end
  end

  def publish_post
    flash[:notice] = 'Post został opublikowany'
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
