class Ingredient < ApplicationRecord
  include ConstantValidatable
  include WeightConversion

  # jitera-anchor-dont-touch: relations

  belongs_to :recipe

  # jitera-anchor-dont-touch: enum
  enum unit: %w[cup teaspoons gram kilogram], _suffix: true

  # jitera-anchor-dont-touch: file

  # jitera-anchor-dont-touch: validation

  validates :unit, presence: true

  validates :amount,
            numericality: { greater_than: 0.0, less_than: 3.402823466e+38, message: I18n.t('.out_of_range_error') }, presence: true

  def convert_to_unit(unit_type)
    if unit_type == 'kilogram'
      convert_to_kilogram(amount, unit)
    elsif unit_type == 'gram'
      convert_to_gram(amount, unit)
    elsif unit_type == 'cup'
      convert_to_cup(amount, unit)
    elsif unit_type == 'teaspoons'
      convert_to_teaspoons(amount, unit)
    end
  end

  # jitera-anchor-dont-touch: reset_password

  class << self
  end
end
