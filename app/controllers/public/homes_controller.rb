class Public::HomesController < ApplicationController
  
  before_action :authenticate_customer!,except: [:top,:about]
  
  def top
    @items = Item.all.order(created_at: :desc).limit(4)
    @genres = Genre.all
  end

  def about
  end
end
