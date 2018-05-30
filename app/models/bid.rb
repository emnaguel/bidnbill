class Bid < ApplicationRecord
  after_initialize :init
  belongs_to :auction
  belongs_to :provider, class_name: "User", foreign_key: "user_id"
  has_one :bill, through: :auction
  has_one :client, through: :auction

  def init
    self.status  ||= "pending"
    self.payment_status  ||= "pending"
  end

  STATUS = ["cancelled","pending", "completed"]
  PAYMENT_STATUS = ["cancelled","pending", "completed"]
end
