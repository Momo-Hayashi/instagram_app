class FavoritesController < ApplicationController
  def index
    @favorites = current_user.favorites.all
  end
  def create
    favorite = current_user.favorites.create(post_id: params[:post_id])
    redirect_to posts_path, notice: "Saved the post from #{favorite.post.user.name}!"
  end
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to posts_path, notice: "Unsaved the post from #{favorite.post.user.name}!"
  end
end
