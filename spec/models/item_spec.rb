require 'rails_helper'
RSpec.describe Item do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('app/assets/images/camera.png')
    end

    describe '商品出品登録' do
      context '商品出品登録がうまくいくとき' do
      it "image, name, description, category_id, condition_id, shipping_fee_id, ship_from_address_id, shipping_days_id, priceが存在すれば登録できる" do
        expect(@item).to be_valid
      end
end

    context '商品出品登録がうまくいかないとき' do
      it "imageが空のとき登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "nameが空のとき登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "descriptionが空のとき登録できない" do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it "category_idが空のとき登録できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "condition_idが空のとき登録できない" do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it "shipping_fee_idが空のとき登録できない" do
        @item.shipping_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end

      it "ship_from_addressが空のとき登録できない" do
        @item.ship_from_address_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship from address can't be blank")
      end

      it "shipping_daysが空のとき登録できない" do
        @item.shipping_days_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping days can't be blank")
      end

      it "priceが空のとき登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "category_idが１のとき登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "condition_idが１のとき登録できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end

      it "shipping_fee_idが１のとき登録できない" do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee must be other than 1")
      end

      it "ship_from_address_idが0のとき登録できない" do
        @item.ship_from_address_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship from address must be other than 1")
      end

      it "shipping_days_idが１のとき登録できない" do
        @item.shipping_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping days must be other than 1")
      end

      it "priceが半角数字ではないとき登録できない" do
        @item.price = "２０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "priceが￥300未満のとき登録できない" do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end

      it "priceが￥10,000,000以上のとき登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end
    end
  end
end