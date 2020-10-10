class DeliveryAddress < ApplicationRecord
    belongs_to :order

    with_options presence: true do
        validates :order_id
        validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/}
        validates :prefecture_id, numericality: { other_than: 1}
        validates :city
        validates :detail_address
        validates :phone_number, format: {with: /\A\d{11}\z/}
    end
end
