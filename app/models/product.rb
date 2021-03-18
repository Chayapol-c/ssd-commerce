class Product < ApplicationRecord
    validates :title, presence: true
    validates :desc, presence: true, length: {minimum:3}
    validates :stock, numericality: {greater_than_or_equal_to: 0}
end