Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Categories routing
  get '/categories', to: 'category#get_all_categories'
  get '/categories/:id', to: 'category#get_single_category'
  post '/categories', to: 'category#create_category'
  put 'categories/:id', to: 'category#update_category'
  delete 'categories/:id', to: 'category#remove_category'
end
