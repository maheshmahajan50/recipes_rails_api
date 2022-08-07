class Api::RatingsController < Api::BaseController
  before_action :set_rating, only: %i[show update destroy]
  before_action :authorize_rating_user, only: %i[update destroy]

  def index
    @ratings = Rating.all
  end

  def create
    @rating = Rating.new(rating_params)
    @error_object = @rating.errors.messages unless @rating.save
  end

  def show
    @error_message = true if @rating.blank?
  end

  def update
    unless @error_object.present?
      @error_object = @rating.errors.messages unless @rating.update(rating_params)
    end
  end

  def destroy
    unless @error_object.present?
      @error_message = true unless @rating&.destroy
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:rate, :user_id, :recipe_id)
  end

  def set_rating
    @rating = Rating.find_by(id: params[:id])
  end

  def authorize_rating_user
    @error_object = 'Unauthorized user to perform this action' if current_user.id != @rating&.user_id
  end
end
