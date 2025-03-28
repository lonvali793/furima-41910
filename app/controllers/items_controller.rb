class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show ]
  def index
  end

  def new
  end
  
end


private

def item_params
  params.require(:item).permit(:item_name, :item_content, :item_category_id, :item_condition_id , :shipping_cost_id, :prefecture_id, :delivery_time_id, :price     )
  end