class Session < ApplicationRecord
  belongs_to :workout
  has_one :user, through: :workout
end
