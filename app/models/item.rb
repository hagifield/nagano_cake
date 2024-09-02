class Item < ApplicationRecord
  
  has_one_attached :image
  belongs_to :genre, optional: true
  has_many :cart_items
  
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :genre_id, presence: true
  
  def get_cake_image(width,height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no-image.jpeg')
      image.attach(io: File.open(file_path), filename: 'no-image.jpeg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
  
  def after_tax_price
    (price * 1.1).floor
  end
  
end
