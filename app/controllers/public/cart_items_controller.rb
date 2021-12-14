class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @item = Item.find_by(params[:item_id])
    @total = 0
    @cart_items.each do |cart_item|
      @total += cart_item.subtotal
    end
  end

  def update
    cart_item = current_customer.cart_items
    #cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])  # データ（レコード）を1件取得
    cart_item.destroy  # データ（レコード）を削除
    redirect_to cart_items_path  # 投稿一覧画面へリダイレクト
  end

  def destroy_all
    cart_item = current_customer.cart_items
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    if customer_signed_in?
      @cart_item = CartItem.new(cart_item_params)
      current_cart_items = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      @cart_item.customer_id = current_customer.id
      if current_cart_items.present?
        cart_item = CartItem.find_by(item_id: @cart_item.item_id, customer_id: current_customer.id)
        cart_item.update!(amount: cart_item.amount + @cart_item.amount)
        redirect_to cart_items_path
      else
        @cart_item.save!
        redirect_to cart_items_path
      end

    else
      redirect_to new_customer_session_path

    end

  end

  private
    def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount,:customer_id, :subtotal)
    end

end
