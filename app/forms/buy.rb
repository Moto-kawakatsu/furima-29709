class Buy

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :detail_address, :building_name, :phone_number, :token, :item_id, :user_id
  
  with_options presence: true do    
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1}
    validates :city
    validates :detail_address
    validates :phone_number, format: {with: /\A\d{11}\z/}
    validates :token
    
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    DeliveryAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, detail_address: detail_address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end