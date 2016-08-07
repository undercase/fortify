class User < ApplicationRecord
  has_secure_password
  validates_presence_of :email, :first_name
  validates_length_of :email, minimum: 7, maximum: 60
  validates_length_of :first_name, minimum: 1
  validates_length_of :password, minimum: 6
  has_many :workouts
end
