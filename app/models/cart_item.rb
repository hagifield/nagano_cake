class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer
  
  validates :amount, presence: true
  
  def after_tax_price
    (price * 1.1).floor
  end
  
  def subtotal
    item.after_tax_price * amount
  end
end
