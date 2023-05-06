class Product < ApplicationRecord
  validates :name, :price, presence: true

  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many_attached :images
end
