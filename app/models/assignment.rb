class Assignment < ApplicationRecord
    belongs_to :customer
    belongs_to :company
    validates :customer, :company, presence: true
end
