class Endpoint < ApplicationRecord
  validates :description, :url, presence: true
end
