class Company < ApplicationRecord
    has_many :assignment, dependent: :destroy
    has_many :customer, through: :assignment
end
