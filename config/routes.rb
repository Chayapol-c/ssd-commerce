Rails.application.routes.draw do
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root "products#index"
  # get "/products", to: "products#index"
  get "/categories", to: "categories#index"
  
  root "admins/products#index"
  
  namespace :admins do 
    resources :products
    
    namespace :products do
      post 'csv_upload'
    end
  end

  resources :categories
end
