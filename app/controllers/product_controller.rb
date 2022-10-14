class ProductController < ApplicationController
  def get_all_products
    records = Product.all
    response = HashWithIndifferentAccess.new({
      products: records
    })
    render json: response, status: 200
  end

  def get_single_product
    begin
      record = Product.find(get_product_id_param)
      response = ActiveSupport::HashWithIndifferentAccess.new({
        product: record
      })
      render json: response, status: 200
    rescue => e
      render json: { error: e }, status: 400
    end
  end
  
  def create_product
    ActiveRecord::Base.transaction do
      begin
        record = Product.create!(get_product_params)
        render json: { status: 'created', product_id: record.id}, status: 201
      rescue => e
        render json: e, status: 400
      end
    end
  end

  def update_product
    ActiveRecord::Base.transaction do
      begin
        record = Product.find(get_product_id_param)
        record.update!(get_product_params)

        render json: { status: 'updated', product_id: record.id}, status: 201
      rescue => e
        render json: { error: e}, status: 400
      end
    end
  end

  def remove_product
    ActiveRecord::Base.transaction do
      begin
        record = Product.find(get_product_id_param)
        record.delete

        render json: { status: 'deleted'}, status: 201
      rescue => e
        render json: {error: e}, status: 400
      end
    end
  end

  private

  def get_product_id_param
    params.permit(:id)[:id]
  end

  def get_product_params
    params.require(:product).permit(:name, :quantity, :description, :image_url, :category_id)
  end
end
