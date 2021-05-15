Rails.application.routes.draw do
  devise_for :admins
  root "homes#index"
  match "/admins/products/delete_image_attachment/:id" => "admins/products#delete_image_attachment", via: :get
  resources :homes, only: [:index, :show]


  # get "/new_order", to: "order#new"
  # post "/create_order", to: "orders#create"
  resources :orders 

  namespace :admins do 
    resources :products
    namespace :products do
      post 'csv_upload'
      delete 'delete_image_attachment'
    end
    resources :categories
    resources :orders, only: :index
  end

end
