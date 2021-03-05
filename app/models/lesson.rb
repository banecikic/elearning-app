class Lesson < ApplicationRecord
  has_many :trainers, :through => :bookings

  has_many :clients, :through => :bookings

  has_many :bookings, :inverse_of => :lessons
  accepts_nested_attributes_for :bookings

  # mount_uploader :image, LessonUploader
end
