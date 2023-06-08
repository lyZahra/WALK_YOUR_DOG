class Pet < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def average_rating
    return "#{reviews.map(&:rating).sum / reviews.count}/5" if reviews.present?

    "No reviews yet"
  end
end
