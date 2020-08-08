class Customer < ApplicationRecord
    has_many :assignment, dependent: :destroy
    has_many :company, through: :assignment
end
