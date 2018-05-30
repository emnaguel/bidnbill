class Bill < ApplicationRecord
  after_update :destroy_auction

  belongs_to :client, class_name: 'User', foreign_key: 'user_id'
  has_one :auction, dependent: :destroy
  CATEGORIES = ['Electricité', 'Gaz', 'Téléphonie', 'Box Internet']
  after_update :destroy_auction
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :category

  mount_uploader :photo, PhotoUploader


  private

  def destroy_auction
    unless auction == nil
      auction.destroy
    end
  end
end
