class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  enum order_status: { pending: 0, confirmed: 1, shipped: 2, delivered: 3 }
  enum payment_method: { credit_card: 0, transfer: 1 }
end
