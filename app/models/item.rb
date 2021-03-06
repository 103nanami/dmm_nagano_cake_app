class Item < ApplicationRecord
  attachment :image

  has_many :cart_items
  has_many :orders
  has_many :order_details
  belongs_to :genre

  def with_tax_price
    (price * 1.1).floor
  end


end
