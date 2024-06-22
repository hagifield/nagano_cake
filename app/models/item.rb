class Item < ApplicationRecord
  
  has_one_attached :image
  belongs_to :genre
  
  def get_cake_image(width,height)
    unless imame.attached?
      file_path = Rails.root.join('app/assets/images/sweets_shortcake')
      image.attach(io: File.open(file_path),filename: 'sweets_shortcake', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
end
