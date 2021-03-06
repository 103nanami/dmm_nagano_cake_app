class Public::CustomersController < ApplicationController
  protect_from_forgery

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    customer = current_customer
    customer.update(customer_params)
    redirect_to  customers_my_page_path
  end

  def confirm

  end

  def withdraw
    @customer = current_customer
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_active: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to top_path
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name,:last_name_kana,:first_name_kana,:email,:postal_code,:adress,:telephone_number)
  end
end
