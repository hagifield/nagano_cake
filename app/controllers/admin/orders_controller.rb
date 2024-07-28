class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all.includes(order_details: :item)
  end

  def show
    @order = Order.find(params[:id])
  end
  
  def edit
    @order = Order.find(params[:id])
  end

  def update
  end
  
  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shipping_fee, :charge)
  end
  
end
