class Category < ApplicationRecord
  has_many :bills
  has_many :provider_categories
end
