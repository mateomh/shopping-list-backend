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

  # Routes through files
  def get_file_routes(name)
    instance_eval(File.read(Rails.root.join("config/routes/#{name}.rb")))
  end

  # namespace :file_routes, defaults: { format: 'json' } do
    get_file_routes 'products'
  # end

end
