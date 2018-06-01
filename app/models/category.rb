class Category < ApplicationRecord
  has_many :bills
  has_many :provider_categories
  monetize :price_cents
end
