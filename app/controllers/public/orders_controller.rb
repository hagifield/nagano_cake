class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.customer_id = current_customer.id
    @order.shipping_fee = 800
    @catr_items = CartItem.where(customer_id: current_customer.id)
    
    ary = []
    @cart_items.each do |cart_item|
      ary << cart_item.item.price * cart_item.amount
    end
    
    @cart_items_price = ary.sum
    
    @order.total_price = @cart_items_price + @order.shipping_fee
    @order.payment_method = params[:order][:payment_method]
    @order.order_status = @order.payment_method == "credit_card" ? 1:0
    
    @address_type = params[:order][:address_type]
    case @address_type
    when "customer_address"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    when "registered_address"
      selected = Address.find(params[:order][:registered_address_id])
      @order.postal_code = selected.postal_code
      @order.address = selected.address
      @order.name = selected.name
    when "new_address"
      @order.postal_code = params[:order][:new_postal_code]
      @order.address = params[:order][:new_address]
      @order.name = params[:order][:new_name]
    end
    
    
  end

  def confirm
    @cart_items = current_customer.cart_items
    @total_price = @cart_items.inject(0) { |sum, cart_item| sum + (cart_item.item.after_tax_price * cart_item.amount) }
    
   @order = Order.new(order_params)
    if params[:order][:address_type] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_type] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else
      
    end
  end
  
  def finalize
   
    # @order.customer_id = current_customer.id
    # @cart_items = current_customer.cart_items
    
    # @order.status = @order.payment_method == "credit_card" ? 1 : 0
    
    # if @order.save
    #   if @order.order_status == 0
    #     @cart_items.each do |cart_item|
    #       OrderDetail.create!(order_id: @order.id, item_id: cart_item.item.id, price: cart_item.item.price, amount: cart_item.amount, making_status: 0)
    #     end
    #   else
    #     @cart_items.each do |cart_item| 
    #       OrderDetail.create!(order_id: @order.id, item_id: cart_item.item.id, price: cart_item.item.price, amount: cart_item.amount, making_status: 1)
    #     end
    #   end
    #   @cart_items.destroy_all
    #   session.delete(:order)
    #   session.delete(:cart_items)
    #   redirect_to confirm_order_path
    # else
    #   render :items
      
    # end
    
  end

  def completed
  end

  def index
  end

  def show
  end
  
  private
  
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end
  
  
  #def order_params
    #params.require(:order).permit(:payment_method, :postal_code, :address, :name, :address_type, :new_postal_code, :new_address, :new_name)
  #end 
  
end
