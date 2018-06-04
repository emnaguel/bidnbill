class Order < ApplicationRecord
  belongs_to :user
  has_many :bids
  monetize :amount_cents

end
