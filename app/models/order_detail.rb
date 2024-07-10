class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  enum making_status: { not_started: 0, payment_confirmed:1, in_progress: 2, completed: 3 }
end
