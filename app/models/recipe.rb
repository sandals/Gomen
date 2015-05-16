class Recipe < ActiveRecord::Base
  has_many :ingredients, dependent: :destroy
  has_many :steps, dependent: :destroy

  accepts_nested_attributes_for :ingredients, :steps

  enum status: [:draft, :published]
end
