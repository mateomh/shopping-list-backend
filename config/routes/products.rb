scope "/products" do
  get '/all', to: 'product#get_all_products'
  get '/:id', to: 'product#get_single_product'
  post '/create', to: 'product#create_product'
  put '/:id', to: 'product#update_product'
  delete '/:id', to: 'product#remove_product'
end