class ProductController < ApplicationController
  def get_all_products
    records = Product.all
    response = HashWithIndifferentAccess.new({
      products: records
    })
    render json: response, status: 200
  end
end
