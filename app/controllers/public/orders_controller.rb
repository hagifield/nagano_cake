class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def create
    @order = current_customer.order.new(order_params)
    
  end

  def confirm
  end

  def completed
  end

  def index
  end

  def show
  end
end
