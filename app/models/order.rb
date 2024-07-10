class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  enum order_status: { pending: 0, confirmed: 1, in_progress:2, in_preparation: 3, shipped: 4 }
  enum payment_method: { credit_card: 0, transfer: 1 }
end
