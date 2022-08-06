class Recipe < ApplicationRecord
  include ConstantValidatable

  # jitera-anchor-dont-touch: relations

  has_many :ingredients, dependent: :destroy

  belongs_to :category

  belongs_to :user

  # jitera-anchor-dont-touch: enum
  enum difficulty: %w[easy normal challenging], _suffix: true

  # Scopes for search
  scope :by_title, ->(title) { where("title LIKE ?", title) }
  scope :by_difficulty, ->(difficulty) { where(difficulty: difficulty) }
  scope :by_time_range, ->(time_from, time_to) { where(time: time_from..time_to) }

  # jitera-anchor-dont-touch: file

  # jitera-anchor-dont-touch: validation

  validates :title, length: { maximum: 255, minimum: 0, message: I18n.t('.out_of_range_error') }, presence: true

  validates :descriptions, length: { maximum: 65_535, minimum: 0, message: I18n.t('.out_of_range_error') },
                           presence: true
  
  # Modified the time validation as per column modification
  validates :time, numericality: { greater_than: 0 , message: I18n.t('.out_of_range_error') }, presence: true

  validates :difficulty, presence: true

  accepts_nested_attributes_for :ingredients

  def self.associations
    [:ingredients]
  end

  # jitera-anchor-dont-touch: reset_password

  class << self
  end
end
