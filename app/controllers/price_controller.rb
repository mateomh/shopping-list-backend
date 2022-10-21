class PriceController < ApplicationController
  def get_all_prices
    begin
      result = Prices::GetAllPrices.run!

      render json: result, status: 200
    rescue => e
      render json: { error: e }, status: 400
    end
  end

  def get_single_price
    begin
      result = Prices::GetPrice.run!(
        price_id: get_price_id_param
      )

      render json: result, status: 200
    rescue => e
      render json: { error: e }, status: 400
    end
  end
  
  def create_price
    begin
      result = Prices::CreatePrice.run!(
        price: get_price_params[:price],
        store_id: get_price_params[:store_id],
        product_id: get_price_params[:product_id]
      )

      render json: { status: 'created', price_id: result.id}, status: 201
    rescue => e
      render json: e, status: 400
    end
  end

  def update_price
    begin
      result = Prices::UpdatePrice.run!(
        price_id: get_price_id_param,
        price_information: get_price_params
      )

      render json: { status: 'updated', price_id: result.id}, status: 201
    rescue => e
      render json: { error: e}, status: 400
    end
  end

  def remove_price
    begin
      result = Prices::DeletePrice.run!(
        price_id: get_price_id_param
      )

      render json: { status: 'deleted'}, status: 201
    rescue => e
      render json: {error: e}, status: 400
    end
  end

  private

  def get_price_id_param
    params.permit(:id)[:id]
  end

  def get_price_params
    params.require(:price).permit(:price, :store_id, :product_id)
  end
end
