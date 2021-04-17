
class Admins::ProductsController < ApplicationController
    before_action :authenticate_admin!, except: [:index, :show]

    def index
        @products = Product.all

        respond_to do |format|
            format.html {  }
            format.csv { send_data generate_csv(Product.all), file_name: 'products.csv' }
        end
    end

    def show
        @product = Product.find(params[:id])
    end

    def new
        @product = Product.new
        @all_categories = Category.all
        @product_category = @product.product_categories.build
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

    def csv_upload
        data = params[:csv_file].read.split("\n")
        data.each do |line|
            attribute = line.split(",").map(&:strip)
            Product.create title: attribute[0], desc: attribute[1], stock: attribute[2]
            puts data
        end
        redirect_to action: :index
    end

    def delete_image_attachment
        @product_img = ActiveStorage::Attachment.find(params[:id])
        @product_img.purge
        redirect_to action: :index
    end


    private
    def generate_csv(products)
        products.map { |p| [p.title, p.desc, p.stock].join(',') }.join("\n")
    end

    def product_params
        params.require(:product).permit(:title, :desc, :status, :primary_image, :stock, category_ids: [], images: [])
    end
end
