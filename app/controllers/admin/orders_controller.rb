class Admin::OrdersController < ApplicationController
  def show
    #@order = Order.where(order_id:current_order.id)
    @order = Order.find(params[:id])
    @orders = Order.all
  end

  def update
  end

  private
  def order_params
    params.require(:order).permit(:delivery_adress_number, :delivery_adress, :delivery_name, :postage, :totalprise,:payment_method,:customer_id)
  end
style="background-color:#f0f0f0;"
end
