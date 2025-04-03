class OrdersController < ApplicationController

  def index
    Order.includes(:item).all
  end

  def create
  end

end

private

