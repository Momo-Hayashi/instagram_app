class UsersController < ApplicationController
  before_action :set_users, only: [:show, :edit, :update]
  skip_before_action :login_required, only: [:new, :create]
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to posts_path, notice: "Welcome to Insta, #{@user.name}!"
    else
      render :new
    end
  end
  def update
    if @user.update(user_params)
      redirect_to user_path, notice: "Successfully updated!"
    else
      render :edit
    end
  end

  private
  def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation,:avatar, :avatar_cache)
  end
  def set_users
  @user = User.find(params[:id])
  end
end
