class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.all
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
      if @address.update(address_params)
        flash[:notice] = "配送先の編集が完了しました"
        redirect_to addresses_path
      else
        @address = Address.find(params[:id])
        render :edit
      end
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
      if @address.save
        flash[:notice] = "配送先を追加しました"
        redirect_to addresses_path
      else
        @addresses = Address.all
        @address = Address.new
        render :index
      end
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    flash[:notice] = "配送先を削除しました"
    redirect_to addresses_path
  end
  
  private
  def address_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :address)
  end
  
end
