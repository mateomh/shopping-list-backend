class ProductController < ApplicationController
  def get_all_products
    begin
      result = Products::GetAllProducts.run!

      render json: result, status: 200
    rescue => e
      render json: { error: e }, status: 400
    end
  end

  def get_single_product
    begin
      result = Products::GetProductInfo.run!(
        product_id: get_product_id_param
      )

      render json: result, status: 200
    rescue => e
      render json: { error: e }, status: 400
    end
  end
  
  def create_product
    begin
      result = Products::CreateProduct.run!(
        name: get_product_params[:name],
        description: get_product_params[:description],
        quantity: get_product_params[:quantity],
        image_url: get_product_params[:image_url],
        category_id: get_product_params[:category_id]
      )

      render json: { status: 'created', product_id: result.id}, status: 201
    rescue => e
      render json: e, status: 400
    end
  end

  def update_product
    begin
      result = Products::UpdateProduct.run!(
        product_id: get_product_id_param,
        product_information: get_product_params
      )

      render json: { status: 'updated', product_id: result.id}, status: 201
    rescue => e
      render json: { error: e}, status: 400
    end
  end

  def remove_product
    begin
      Products::DeleteProduct.run!(
        product_id: get_product_id_param
      )

      render json: { status: 'deleted'}, status: 201
    rescue => e
      render json: {error: e}, status: 400
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
