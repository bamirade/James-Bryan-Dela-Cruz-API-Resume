class Feedback < ApplicationRecord
  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
  validates :comments, present: true, length: { maximum: 2000, minimum: 6 }
end
