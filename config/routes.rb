Rails.application.routes.draw do
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root "products#index"
  # get "/products", to: "products#index"
  get "/categories", to: "categories#index"
  
  root "admins/products#index"
  match "/admins/products/delete_image_attachment/:id" => "admins/products#delete_image_attachment", via: :get
  namespace :admins do 
    resources :products
    namespace :products do
      post 'csv_upload'
      # delete 'delete_image_attachment'
    end
    resources :categories
  end

end
