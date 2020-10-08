class DeliveryAddressesController < ApplicationController

    def index
    end

    def new
        @delivery_address = DeliveryAddress.new
    end

    def create
        @delivery_address = DeliveryAddress.create(delivery_address_params)
    end

    private

    def delivery_address_params
        params.require(:delivery_address).permit(:postal_code, :prefecture_id, :city, :detail_address, :building_name, :phone_number).merge(order_id: order_id)
    end

end
