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


validates :user, :name, :category, :description, :category, :condition, :shipping_fee, :ship_from_address, :shipping_days, :price,  presence: true

validates :category_id, numericality: { other_than: 1 }
validates :condition_id, numericality: { other_than: 1 } 
validates :shipping_fee_id, numericality: { other_than: 1 } 
validates :ship_from_id, numericality: { other_than: 1 } 
validates :shipping_days_id, numericality: { other_than: 1 }  
end