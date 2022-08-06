class Api::IngredientsController < Api::BaseController
  # jitera-anchor-dont-touch: before_action_filter

  # jitera-anchor-dont-touch: actions
  def destroy
    @ingredient = Ingredient.find_by(id: params[:id])

    @error_message = true unless @ingredient&.destroy
  end

  def update
    @ingredient = Ingredient.find_by(id: params[:id])

    request = {}
    request.merge!('unit' => params.dig(:ingredients, :unit))
    request.merge!('amount' => params.dig(:ingredients, :amount))
    request.merge!('recipe_id' => params.dig(:ingredients, :recipe_id))

    @error_object = @ingredient.errors.messages unless @ingredient.update(request)
  end

  def show
    @ingredient = Ingredient.find_by(id: params[:id])
    @error_message = true if @ingredient.blank?
  end

  def create
    @ingredient = Ingredient.new

    request = {}
    request.merge!('unit' => params.dig(:ingredients, :unit))
    request.merge!('amount' => params.dig(:ingredients, :amount))
    request.merge!('recipe_id' => params.dig(:ingredients, :recipe_id))

    @ingredient.assign_attributes(request)
    @error_object = @ingredient.errors.messages unless @ingredient.save
  end

  def index
    request = {}

    request.merge!('unit' => params.dig(:ingredients, :unit))
    request.merge!('amount' => params.dig(:ingredients, :amount))
    request.merge!('recipe_id' => params.dig(:ingredients, :recipe_id))

    @ingredients = Ingredient.all
  end

  def unit_conversion
    @ingredient = Ingredient.find(params[:id])
    @amount = @ingredient.convert_to_unit(params[:unit_type]).round(2) if @ingredient rescue 0
  end
end
