class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show ]
  before_action  :set, only: [:edit, :update]
  
  def index
    @items = Item.includes(:user).order(created_at: :desc)
  end

  def new
    @item = Item.new
  end
  
 def show
  @item = Item.find(params[:id])  
end

def edit
  unless current_user.id == @item.user_id
    redirect_to root_path
end
end


def update
if @item.update(item_params)
  redirect_to item_path(@item.id)
else
  render :edit,status: :unprocessable_entity
end
end

def set
  @item = Item.find(params[:id])
end


def create
@item = Item.new(item_params)
if @item.save
  redirect_to root_path
else
  render :new, status: :unprocessable_entity
end
end


private

def item_params
  params.require(:item).permit(:image,:item_name, :item_content, :item_category_id, :item_condition_id, :shipping_cost_id, :prefecture_id, :delivery_time_id, :price).merge(user_id: current_user.id)
  end

end