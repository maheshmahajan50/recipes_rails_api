require 'rails_helper'

RSpec.describe Rating, type: :model do
  let(:rating) do
    build(:rating)
  end

  describe 'Assocations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:recipe) }
  end

  describe 'Valid subject' do
    it 'is valid rating' do
      expect(rating).to be_valid
    end
  end

  describe 'Invalid rating validations' do
    it 'is invalid rate value' do
      rating.rate = 23
      expect(rating).not_to be_valid
    end

    context 'validates uniqueness of user rating for recipe' do
      it 'returns a validation error message' do
        recipe = create(:recipe)
        user = create(:user)
        create(:rating, user_id: user.id, recipe_id: recipe.id)
        rating = build(:rating, user_id: user.id, recipe_id: recipe.id)

        valid = rating.valid?

        expect(valid).to eq(false)
        expect(rating.errors.full_messages).to include('User has already been taken')
      end
    end
  end
end
