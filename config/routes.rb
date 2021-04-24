Rails.application.routes.draw do
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/categories", to: "categories#index"
  root "homes#index"
  match "/admins/products/delete_image_attachment/:id" => "admins/products#delete_image_attachment", via: :get
  resources :homes, only: [:index, :show]
  namespace :admins do 
    resources :products
    namespace :products do
      post 'csv_upload'
      # delete 'delete_image_attachment'
    end
    resources :categories
  end

end
