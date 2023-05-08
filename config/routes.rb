Rails.application.routes.draw do
  get 'bill/bill'
  post '/pdf/generate', to: 'pdf#generate', format: :pdf
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
