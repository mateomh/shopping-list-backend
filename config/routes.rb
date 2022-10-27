Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Categories routing
  get '/categories', to: 'category#get_all_categories'
  get '/categories/:id', to: 'category#get_single_category'
  post '/categories', to: 'category#create_category'
  put 'categories/:id', to: 'category#update_category'
  delete 'categories/:id', to: 'category#remove_category'

  # Store model routes
  scope :stores, defaults: { format: 'json' } do
    get '/all', to: 'store#get_all_stores'
    get '/:id', to: 'store#get_single_store'
    post '/create', to: 'store#create_store'
    put '/:id', to: 'store#update_store'
    delete '/:id', to: 'store#remove_store'
  end

  # Price model routes
  scope :prices, defaults: { format: 'json' } do
    get '/all', to: 'price#get_all_prices'
    get '/:id', to: 'price#get_single_price'
    post '/create', to: 'price#create_price'
    put '/:id', to: 'price#update_price'
    delete '/:id', to: 'price#remove_price'
  end

  # Routes through files
  def get_file_routes(name)
    instance_eval(File.read(Rails.root.join("config/routes/#{name}.rb")))
  end

  # namespace :file_routes, defaults: { format: 'json' } do
    get_file_routes 'products'
  # end

end
