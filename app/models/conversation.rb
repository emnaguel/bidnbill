class Conversation < ApplicationRecord
  belongs_to :provider, class_name: 'User', foreign_key: 'user_id'
  belongs_to :auction
  has_one :client, through: :auction
  has_many :messages

  validates :provider, uniqueness: {scope: :auction}
end
