FactoryBot.define do
  factory :rating do
    user
    recipe
    rate { 4 }
  end
end
