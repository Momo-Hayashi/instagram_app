class PostsController < ApplicationController
  before_action :set_posts, only:[:show, :edit, :destroy, :update]
  skip_before_action :login_required, only: [:index, :show]
  def index
    @posts = Post.all.order(created_at: :desc)
  end
  def new
    @post = Post.new
  end

  def confirm
    @post = current_user.posts.build(post_params)
    render :new if @post.invalid?
  end

  def create
    @post = current_user.posts.build(post_params)
    if params[:back]
      render :new
    else
      if @post.save
        redirect_to posts_path, notice: "Successfully posted!"
      else
        render :new
      end
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Successfully deleted!"
  end
  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: "Successfully updated!"
    else
      render :edit
    end
  end

  private
  def post_params
  params.require(:post).permit(:content, :image, :image_cache)
  end
  def set_posts
    @post = Post.find(params[:id])
  end
end
