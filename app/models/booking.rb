class Booking < ApplicationRecord
  belongs_to :pet
  belongs_to :user
  has_many :reviews, dependent: :destroy
  # STATUSES = %i[pending accepted denied completed].map(&:to_s).freeze
  # validates :quote_requestor, inclusion: { in: Booking::STATUSES }
end
