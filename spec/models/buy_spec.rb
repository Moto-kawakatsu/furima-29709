require 'rails_helper'

RSpec.describe Buy do
    before do
      @buy = FactoryBot.build(:buy)
      @buy.user_id  {1}
      @buy.item_id  {1}
    end
  
    describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
  
        it "postal_code, prefecture, city, detail_address, phone_number, user_id, item_id, tokenが存在するとき購入できる" do
          expect(@buy).to be_valid
        end
  end
  
    context '商品購入がうまくいかないとき' do
  
    it "postl_codeが空のとき" do
      @buy.postal_code = ""
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Postal code can't be blank")
    end
  
    it "postl_codeがハイフン無しのとき" do
      @buy.postal_code = "1111111"
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Postal code is invalid")
    end
  
    it "prefectureが空のとき" do
      @buy.prefecture_id = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Prefecture can't be blank")
    end
  
    it "cityが空のとき" do
      @buy.city = ""
      @buy.valid?
      expect(@buy.errors.full_messages).to include("City can't be blank")
    end
  
    it "detail_addressが空のとき" do
      @buy.detail_address = ""
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Detail address can't be blank")
    end
  
    it "phone_numberが空のとき" do
      @buy.phone_number = ""
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Phone number can't be blank")
    end
  
    it "tokenが空のとき" do
      @buy.token = ""
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Token can't be blank")
    end

    it "phone_numberが11文字ではないとき" do
      @buy.phone_number = "111111"
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Phone number is invalid")
    end
  
    it "phone_numberが半角数字ではないとき" do
      @buy.phone_number = "１１１１１１１１１１１"
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Phone number is invalid")
    end
    
  end
  end
end
