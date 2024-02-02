class Experience < ApplicationRecord
  validates :title, :company, :start_date, :end_date, presence: true
end
