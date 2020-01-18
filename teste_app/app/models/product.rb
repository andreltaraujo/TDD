class Product < ApplicationRecord
  belongs_to :category

  validates :category, :description, :price, presence: true

  def full_description
    "#{self.description} - #{self.price}"
  end
end
