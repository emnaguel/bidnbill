class Bid < ApplicationRecord
  belongs_to :auction
  belongs_to :provider, class_name: "User", foreign_key: "user_id"
  has_one :bill, throught: :auction
  has_one :client, throught: :auction
end
