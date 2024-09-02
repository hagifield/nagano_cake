class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  enum order_status: { pending: 0, confirmed: 1, in_progress:2, in_preparation: 3, shipped: 4 }
  enum payment_method: { credit_card: 0, transfer: 1 }
  
  validates :name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  
  def translated_order_status
    I18n.t("enums.order.order_status.#{order_status}")
  end
  
  def translated_payment_method
    I18n.t("enums.order.payment_method.#{payment_method}")
  end
  
  
end
