class Order < ApplicationRecord
    validates :price, presence: true
    validates :token, presence: true

    belongs_to :user
    belongs_to :item

    attr_accessor :token
end
