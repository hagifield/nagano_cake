class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
       flash[:notice] = "You have updated user successfully."
       redirect_to customer_path(@customer)
    else
       render :edit
    end
  end

  def confirm

  end

  def withdraw
    #isactiveをfalse　→ ログアウトさせる
    @customer = Customer.find(current_customer.id)
    @customer.update(is_active: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
    
  end
  
  private
   def customer_params
     params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :address, :postal_code, :telephone_number)
     
   end
end
