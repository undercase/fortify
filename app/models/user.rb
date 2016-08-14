class User < ApplicationRecord
  before_save { |user| user.email = user.email.downcase }
  has_secure_password
  validates_presence_of :email, :first_name
  validates :email, uniqueness: :true
  validates :email, email_format: {message: 'does not appear to be a valid email address'}
  validates_length_of :email, minimum: 7, maximum: 60
  validates_length_of :first_name, minimum: 1
  validates_length_of :password, minimum: 6
  has_many :workouts
  has_many :sessions
end
