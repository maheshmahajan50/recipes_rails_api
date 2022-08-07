if @ratings.present?
  json.ratings @ratings do |rating|
    json.id rating.id
    json.created_at rating.created_at
    json.updated_at rating.updated_at
    json.rate rating.rate
    json.recipe_id rating.recipe_id
    json.user_id rating.user_id
  end
else
  json.error_message @error_message
end
