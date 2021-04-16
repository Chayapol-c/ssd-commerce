class Product < ApplicationRecord
    
    enum status: [:draft, :published, :archived]

    has_one_attached :primary_image
    has_many_attached :images

    has_many :product_categories, dependent: :destroy
    has_many :categories, through: :product_categories

    validates :title, presence: true
    validates :desc, presence: true, length: {minimum:3}
    validates :stock, numericality: { greater_than_or_equal_to: 0 }


end