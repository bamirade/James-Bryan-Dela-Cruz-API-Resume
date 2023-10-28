class Contact < ApplicationRecord
  validates :email, :phone, :gitHub, :linkedIn, presence: true
end
