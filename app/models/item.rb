class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions

belongs_to_active_hash :category
belongs_to :user
has_one :purchase
has_one_attached :image


validates :user, :name, :category, :description, :category, :condition, :shipping_fee, :ship_from_address, :shipping_days, :price,  presence: true
validates :genre_id, numericality: { other_than: 1 } 
end
