class Vehicle < ApplicationRecord
    belongs_to :user

    # Validation
    validates :license_plate, presence: true, format: {with: /\A[a-zA-Z0-9]+\z/i}
    validates :colour, allow_blank: true, format: {with: /\A[a-zA-Z]+\z/i}
    validates :make, presence: true
    validates :year, allow_blank: true, numericality: { 
        only_integer: true,
        greater_than_or_equal_to: 1900,
        less_than_or_equal_to: Date.today.year
      }
end
