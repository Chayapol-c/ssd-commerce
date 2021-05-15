class Admins::OrdersController < ApplicationController
    before_action :authenticate_admin!
    layout 'admins'
    def index
        @orders = Order.all
    end
end