class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @total_price = @cart_items.inject(0) { |sum, cart_item| sum + (((cart_item.item.price*1.1).floor) * cart_item.amount) }
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    flash[:notice] = "カートから商品を削除しました"
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    flash[:notice] = "カートを空にしました"
    redirect_to cart_items_path
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    overlap_cart_item = current_customer.cart_items.find_by(item_id: @cart_item.item_id)
    
    if overlap_cart_item
      new_amount = overlap_cart_item.amount + @cart_item.amount
      if overlap_cart_item.update(amount: new_amount)
        flash[:notice] = "カートに商品が入りました"
        redirect_to cart_items_path
      else
        @item = @cart_item.item
        render 'public/items/show'
      end
    else
      if @cart_item.save
        flash[:notice] = "カートに商品が入りました"
        redirect_to cart_items_path
      else
        @item = @cart_item.item
        render 'public/items/show'
      end
    end
      
      
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      flash[:notice] = "カートの商品を更新しました"
      redirect_to cart_items_path
    else
      render :index
    end
  end
  
  private
    def cart_item_params
      params.require(:cart_item).permit(:amount, :item_id, :customer_id)
    end
end
