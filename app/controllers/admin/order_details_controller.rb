class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  def update
    order_detail = OrderDetail.find(params[:id])
    if order_detail.update(order_detail_params)
      
      if order_detail.making_status == OrderDetail.making_statuses.key(2)#制ステが作成中になったら注ステを製作中にする
        order_detail.order.update(order_status: Order.order_statuses.key(2))
      end
      
      if order_detail.order.order_details.all? { |order_detail| order_detail.making_status == OrderDetail.making_statuses.key(3) }
        order_detail.order.update(order_status: Order.order_statuses.key(3))
      end
      
      flash[:notice] = "編集が完了しました"
      redirect_to admin_order_path(order_detail.order_id)
    else
      @order = @order_detail.order
      render 'admin/orders/show'
    end
  end
  
  private
  def order_detail_params
    params.require(:order_detail).permit(:making_status, :charge, :amount)
  end
end
