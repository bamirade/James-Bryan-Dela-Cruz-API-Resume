class Feedback < ApplicationRecord
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
  validates :message, present: true, length: { maximum: 600, minimum: 6 }
end
