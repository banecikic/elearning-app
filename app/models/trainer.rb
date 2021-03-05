class Trainer < ApplicationRecord
  belongs_to :account, :inverse_of => :trainers
  accepts_nested_attributes_for :account

  belongs_to :user, :inverse_of => :trainers
  accepts_nested_attributes_for :user

  has_many :bookings, dependent: :destroy, :inverse_of => :trainer
  accepts_nested_attributes_for :bookings

  has_many :lessons, :through => :bookings

  has_many :lesson_payments, :through => :bookings

  has_many :schedules, dependent: :destroy, :inverse_of => :trainer
  accepts_nested_attributes_for :schedules

  mount_uploader :photo, TrainerUploader

  def name
    "#{first_name} #{last_name}"
  end

  def email
    User.find_by_id(self.user_id)
  end
end
