class RatingsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_existing_rating, only: [:create]

  def create
    @manga = Manga.find(params[:manga_id])
    @rating = @manga.ratings.new(rating_params)
    @rating.user = current_user

    if @rating.save
      redirect_to @manga, notice: 'Rating was successfully submitted.'
    else
      flash.now[:alert] = @rating.errors.full_messages.join(", ")
      render 'mangas/show'
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:rating)
  end
  
  def check_existing_rating
    @manga = Manga.find(params[:manga_id])
    if @manga.ratings.exists?(user: current_user)
      redirect_to @manga, alert: 'You have already rated this manga.'
    end
  end
end
