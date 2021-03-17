class ProductsController < ApplicationController
    before_action :authenticate_admin!

    def index
        @products = Product.all
    end

    def show
        @product = Product.find(params[:id])
    end

    def new
        @product = Product.new
    end

    def edit
        @product = Product.find(params[:id])
    end

    def create
        @product = Product.create(product_params)

        if @product.invalid?
            flash[:error] = @product.errors.full_messages
        end

        redirect_to action: :index
    end

    def update
        @product = Product.find(params[:id])
        @product.update(product_params)
        redirect_to action: :index
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        redirect_to action: :index
    end

    private
    
    def product_params
        params.require(:product).permit(:title, :desc, :stock)
    end
end
