require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品が出品できる場合' do

      it 'すべての条件が一致した場合は商品を出品できる'do
    expect(@item).to be_valid
    end
  end
end
context '商品が出品できない場合' do
  it 'imageが空では登録できない' do
    @item.image = ''  
    @item.valid?
    expect(@item.errors.full_messages).to include ("Image can't be blank")
  end

  it 'item_nameが空では登録できない' do
    @item.item_name = ''  
    @item.valid?
    expect(@item.errors.full_messages).to include ("Item name can't be blank")
  end
  it 'item_contentが空では登録できない' do
    @item.item_content = ''  
    @item.valid?
    expect(@item.errors.full_messages).to include ("Item content can't be blank")
  end

  it 'item_category_idが1（項目を選択しない）時は登録できない' do
    @item.item_category_id = 1  
    @item.valid?
    expect(@item.errors.full_messages).to include ("Item category can't be blank")
  end

  it 'item_condition _idが1（項目を選択しない）時は登録できない' do
    @item.item_condition_id = 1  
    @item.valid?
    expect(@item.errors.full_messages).to include ("Item condition can't be blank")
  end
  it 'shipping_cost_idが1（項目を選択しない）時は登録できない' do
    @item.shipping_cost_id = 1  
    @item.valid?
    expect(@item.errors.full_messages).to include ("Shipping cost can't be blank")
  end
  it 'prefecture_idが1（項目を選択しない）時は登録できない' do
    @item.prefecture_id = 1  
    @item.valid?
    expect(@item.errors.full_messages).to include ("Prefecture can't be blank")
  end
  it 'delivery_time_idが1（項目を選択しない）時は登録できない' do
    @item.delivery_time_id = 1  
    @item.valid?
    expect(@item.errors.full_messages).to include ("Delivery time can't be blank")
  end

  it 'priceが300円より少ない場合は登録できない' do
    @item.price = 299  
    @item.valid?
    expect(@item.errors.full_messages).to include ("Price is invalid.enter the price in half-width alphanumeric characters, within the range of 300 yen to 9,999,999 yen.")
  end
  it 'priceが9999999円より多い場合は登録できない' do
    @item.price = 10000000
    @item.valid?
    expect(@item.errors.full_messages).to include ("Price is invalid.enter the price in half-width alphanumeric characters, within the range of 300 yen to 9,999,999 yen.")
  end
  it 'item_nameが41文字以上では登録できない' do
    @item.item_name = "あ"*41 
    @item.valid?
    expect(@item.errors.full_messages).to include ("Item name is too long (maximum is 40 characters)")
  end
  it 'item_contentが1001文字以上では登録できない' do
    @item.item_content = "あ"*1001
    @item.valid?
    expect(@item.errors.full_messages).to include ("Item content is too long (maximum is 1000 characters)")
  end

  it 'priceが空では登録できない' do
    @item.price = ''  
    @item.valid?
    expect(@item.errors.full_messages).to include ("Price can't be blank")
  end
  it 'priceに半角数字以外が含まれている場合は出品できない' do
    @item.price = '301a'  
    @item.valid?
    expect(@item.errors.full_messages).to include ("Price is invalid.enter the price in half-width alphanumeric characters, within the range of 300 yen to 9,999,999 yen.")
  end
  it 'userが紐付いていないと保存できない' do
    @item.user = nil 
    @item.valid?
    expect(@item.errors.full_messages).to include ("User must exist")
  end

end



end
