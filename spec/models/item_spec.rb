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
end
