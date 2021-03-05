class Schedule < ApplicationRecord
  belongs_to :account, :inverse_of => :schedules
  accepts_nested_attributes_for :account

  belongs_to :trainer, :inverse_of => :schedules
  accepts_nested_attributes_for :trainer

  has_many :bookings, :inverse_of => :schedule
  accepts_nested_attributes_for :bookings

  validates :start, uniqueness: { scope: :trainer_id, message: "You have already made this time available" }

  amoeba do
    enable
    exclude_associations :bookings
  end
end
