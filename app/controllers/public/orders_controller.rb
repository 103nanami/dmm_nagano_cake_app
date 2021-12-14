class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @items = Item.all
  end

  def unsubscribe
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @order.postage = 800
    @total = 0
    @cart_items.each do |cart_item|
      @total += cart_item.subtotal
    end
    @order.totalprise = @order.postage + @total
    if params[:order][:adress_method] == "customer_adress"
      @order.delivery_adress_number = current_customer.postal_code
      @order.delivery_adress = current_customer.adress
      @order.delivery_name = current_customer.last_name + current_customer.first_name
    end

    if params[:order][:adress_method] == "post_adress"
      @adress = Adress.find(params[:order][:adress_id])
      @order.delivery_adress_number = @adress.postal_code
      @order.delivery_adress = @adress.adress
      @order.delivery_name = @adress.last_name + @adress.first_name
    end


    if params[:order][:adress_method] == "new_adress"
      @order = Order.new(order_params)
    end

    @orders = Order.all
    @order.postage == '800'
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save!
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new(order_id: @order.id, item_id: cart_item.item_id,amount: cart_item.amount, price: cart_item.item.price*1.1)
      @order_detail.save!
    end
    current_customer.cart_items.destroy_all
    redirect_to orders_complete_path
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @customer = current_customer
    @orders = Order.all
    #@order_details = @order.order_details
    #@subtotal = @order_details.item.with_tax_price * @order_details.amount
    #@total = 0
    #@orders.each do |order|
      #@total += @subtotal
    #end
  end

  private
  def order_params
    params.require(:order).permit(:delivery_adress_number, :delivery_adress, :delivery_name, :postage, :totalprise,:payment_method,:customer_id)
  end

end
