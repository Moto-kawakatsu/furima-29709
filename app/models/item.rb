class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions

belongs_to_active_hash :category
belongs_to_active_hash :condition
belongs_to_active_hash :shipping_fee
belongs_to_active_hash :ship_from_address
belongs_to_active_hash :shipping_days
belongs_to :user
has_one :purchase
has_one_attached :image


with_options presence: true do
    validates :image
    validates :user
    validates :name
    validates :category
    validates :description
    validates :category_id, numericality: { other_than: 1}
    validates :condition_id, numericality: { other_than: 1}
    validates :shipping_fee_id, numericality: { other_than: 1} 
    validates :ship_from_address_id, numericality: { other_than: 1}
    validates :shipping_days_id, numericality: { other_than: 1}
    validates :price, format: {with: /\A[0-9]+\z/}, numericality: { only_integer: true, greater_than: 300, less_than: 10000000}
end
end