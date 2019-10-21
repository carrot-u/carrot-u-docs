class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show
    set_order
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end
end
