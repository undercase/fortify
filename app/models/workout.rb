class Workout < ApplicationRecord
  validates_presence_of :name
  validates_length_of :name, minimum: 1
  belongs_to :user
  has_many :exercises
end
