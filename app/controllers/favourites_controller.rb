class FavouritesController < ApplicationController
  before_action :correct_user,   only: :destroy
  def create
    @favourite = current_post.favourites.build(fav_params)
    if @favourite.save
      flash[:success] = "Liked!"
      redirect_to request.referrer || root_url
    end
  end

  def destroy
    @favourite.destroy
    flash[:success] = "Unliked!"
    redirect_to request.referrer || root_url
  end

  private

  def fav_params
    params.require(:favourite).permit(:micropost_id, :user_id)
  end

    def current_post
      Micropost.find_by(id: params[:favourite][:micropost_id])
    end

    def correct_user
      @favourite = current_user.favourites.find_by(id: params[:id])

      if @favourite.nil?
        redirect_to root_url
      end
    end
end
