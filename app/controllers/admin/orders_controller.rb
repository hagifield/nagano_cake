class Admin::OrdersController < ApplicationController
  def index
    
    # @recievers_address = @order.postal_code + @order.address + @order.name
    if params[:customer_id]
      @customer = Customer.find(params[:customer_id])
      @orders = @customer.orders
    else
      @orders = Order.all.includes(order_details: :item)
    end
    
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
