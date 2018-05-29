class Bill < ApplicationRecord
  belongs_to :client, class_name: 'User', foreign_key: 'user_id'
  has_one :auction, dependent: :destroy
  CATEGORIES = ['Electricité', 'Gaz', 'Téléphonie', 'Box Internet']
  after_update :destroy_auction

  private

  def destroy_auction
    unless auction == nil
      auction.destroy
    end
  end
end
