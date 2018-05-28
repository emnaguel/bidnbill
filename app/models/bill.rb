class Bill < ApplicationRecord
  belongs_to :client, class_name: 'User', foreign_key: 'user_id'
  has_one :auction
end
