class OrdersController < ApplicationController

    layout 'home'

    def index
        redirect_to homes_path
    end
    def new
        @order = Order.new
    end
    def create 
        @order = Order.create(order_params)
        redirect_to homes_path
    end

    private 
    def order_params
        params.require(:order).permit(:address)
    end
end
