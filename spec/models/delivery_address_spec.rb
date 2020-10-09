  require 'rails_helper'
#   RSpec.describe DeliveryAddress do
#     before do
#       @delivery_address = FactoryBot.build(:delivery_address)
#     end
  
#     describe '商品購入機能' do
#     context '商品購入がうまくいくとき' do
  
#         it "order, postal_code, prefecture, city, detail_address, phone_numberが存在するとき購入できる" do
#           expect(@delivery_address).to be_valid
#         end
#   end
  
#     context '商品購入がうまくいかないとき' do
#     it "orderが空のとき" do
#       @delivery_address.order = nil
#       @delivery_address.valid?
#       expect(@delivery_address.errors.full_messages).to include("Order can't be blank")
#     end
  
#     it "postl_codeが空のとき" do
#       @delivery_address.postal_code = ""
#       @delivery_address.valid?
#       expect(@delivery_address.errors.full_messages).to include("Postal code can't be blank")
#     end
  
#     it "postl_codeがハイフン無しのとき" do
#       @delivery_address.postal_code = "1111111"
#       @delivery_address.valid?
#       expect(@delivery_address.errors.full_messages).to include("Postal code is invalid")
#     end
  
#     it "prefectureが空のとき" do
#       @delivery_address.prefecture_id = nil
#       @delivery_address.valid?
#       expect(@delivery_address.errors.full_messages).to include("Prefecture can't be blank")
#     end
  
#     it "cityが空のとき" do
#       @delivery_address.city = ""
#       @delivery_address.valid?
#       expect(@delivery_address.errors.full_messages).to include("City can't be blank")
#     end
  
#     it "detail_addressが空のとき" do
#       @delivery_address.detail_address = ""
#       @delivery_address.valid?
#       expect(@delivery_address.errors.full_messages).to include("Detail address can't be blank")
#     end
  
#     it "phone_numberが空のとき" do
#       @delivery_address.phone_number = ""
#       @delivery_address.valid?
#       expect(@delivery_address.errors.full_messages).to include("Phone number can't be blank")
#     end
  
#     it "phone_numberが11文字ではないとき" do
#       @delivery_address.phone_number = "111111"
#       @delivery_address.valid?
#       expect(@delivery_address.errors.full_messages).to include("Phone number is invalid")
#     end
  
#     it "phone_numberが半角数字ではないとき" do
#       @delivery_address.phone_number = "１１１１１１１１１１１"
#       @delivery_address.valid?
#       expect(@delivery_address.errors.full_messages).to include("Phone number is invalid")
#     end
#   end
#   end
# end