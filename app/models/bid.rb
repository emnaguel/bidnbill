class Bid < ApplicationRecord
  belongs_to :auction
  belongs_to :provider, class_name: "User", foreign_key: "user_id"
  has_one :bill, through: :auction
  has_one :client, through: :auction
end
