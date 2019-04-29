class Restaurant < ApplicationRecord
  belongs_to :category

  has_many :product_categories
  has_many :orders
  has_many :reviews

  has_one_attached :image

  validates_associated :category
  validates :name, :status, :delivery_tax, :city, :street, presence: true

  enum status: { closed: 0, open: 1 }

  geocoded_by :address
 
  after_validation :geocode
  
  def address
    [street, number, city, state].compact.join(', ')
  end

end
