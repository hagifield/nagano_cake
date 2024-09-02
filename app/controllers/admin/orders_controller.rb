class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @items = Item.page(params[:page]).per(8)
    # @recievers_address = @order.postal_code + @order.address + @order.name
    if params[:customer_id]
      @customer = Customer.find(params[:customer_id])
      @orders = @customer.orders.page(params[:page]).per(10).order(created_at: :desc)
    else
      @orders = Order.page(params[:page]).per(10).includes(order_details: :item).order(created_at: :desc)
    end
    
  end

  def show
    @order = Order.find(params[:id])
    
  end
  
  def edit
    @order = Order.find(params[:id])
  end

  def update
    order = Order.find(params[:id])
    if order.update(order_params)
      flash[:notice] = "編集が完了しました"
      redirect_to admin_order_path(order)
    else
      @order = Order.find(params[:id])
      render :show
    end
  end
  
  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shipping_fee, :charge, :order_status)
  end
  
end
