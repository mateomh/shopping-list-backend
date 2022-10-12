scope "/products" do
  get '/all', to: 'product#get_all_products'
end