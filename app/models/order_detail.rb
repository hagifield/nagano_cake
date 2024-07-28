class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  enum making_status: { not_started: 0, payment_confirmed:1, in_progress: 2, completed: 3 }
  
  def after_tax_price
    (charge * 1.1).floor
  end
  
  
end
