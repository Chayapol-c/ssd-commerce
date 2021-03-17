class Product < ApplicationRecord
    validates :title, presence: true
    validates :desc, presence: true, length: {minimum:3}
end