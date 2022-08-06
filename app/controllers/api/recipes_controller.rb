class Api::RecipesController < Api::BaseController
  # jitera-anchor-dont-touch: before_action_filter
  before_action :doorkeeper_authorize!, only: %w[index show update destroy]
  before_action :current_user_authenticate, only: %w[index show update destroy]
  before_action :recipes, only: [:search]

  # jitera-anchor-dont-touch: actions
  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    @error_message = true unless @recipe&.destroy
  end

  def update
    @recipe = Recipe.find_by(id: params[:id])

    request = {}
    request.merge!('title' => params.dig(:recipes, :title))
    request.merge!('descriptions' => params.dig(:recipes, :descriptions))
    request.merge!('time' => params.dig(:recipes, :time))
    request.merge!('difficulty' => params.dig(:recipes, :difficulty))
    request.merge!('category_id' => params.dig(:recipes, :category_id))
    request.merge!('user_id' => params.dig(:recipes, :user_id))

    @error_object = @recipe.errors.messages unless @recipe.update(request)
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
    @error_message = true if @recipe.blank?
  end

  def create
    @recipe = Recipe.new

    request = {}
    request.merge!('title' => params.dig(:recipes, :title))
    request.merge!('descriptions' => params.dig(:recipes, :descriptions))
    request.merge!('time' => params.dig(:recipes, :time))
    request.merge!('difficulty' => params.dig(:recipes, :difficulty))
    request.merge!('category_id' => params.dig(:recipes, :category_id))
    request.merge!('user_id' => params.dig(:recipes, :user_id))

    @recipe.assign_attributes(request)
    @error_object = @recipe.errors.messages unless @recipe.save
  end

  def index
    request = {}

    request.merge!('title' => params.dig(:recipes, :title))
    request.merge!('descriptions' => params.dig(:recipes, :descriptions))
    request.merge!('time' => params.dig(:recipes, :time))
    request.merge!('difficulty' => params.dig(:recipes, :difficulty))
    request.merge!('category_id' => params.dig(:recipes, :category_id))
    request.merge!('user_id' => params.dig(:recipes, :user_id))

    @recipes = Recipe.all
  end

  def search
    search_by_title
    search_by_time_range
    search_by_difficulty
  end

  private

  def search_params
    params.require(:recipe_search).permit(:title, :difficulty, time_range: [:time_from, :time_to])
  end

  def recipes
    @recipes ||= Recipe
  end

  def search_by_title
    @recipes = @recipes.by_title(search_params['title']) if search_params['title']
  end

  def search_by_difficulty
    @recipes = @recipes.by_difficulty(search_params['difficulty']) if search_params['difficulty']
  end

  def search_by_time_range
    time_range = search_params['time_range']

    if time_range.present? && time_range['time_from'] && time_range['time_to']
      @recipes = @recipes.by_time_range(time_range['time_from'], time_range['time_to'])
    end
  end
end
