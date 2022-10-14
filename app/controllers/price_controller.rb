class PriceController < ApplicationController
  def get_all_prices
    records = Price.all
    response = HashWithIndifferentAccess.new({
      prices: records
    })
    render json: response, status: 200
  end

  def get_single_price
    begin
      record = Price.find(get_price_id_param)
      response = ActiveSupport::HashWithIndifferentAccess.new({
        price: record
      })
      render json: response, status: 200
    rescue => e
      render json: { error: e }, status: 400
    end
  end
  
  def create_price
    ActiveRecord::Base.transaction do
      begin
        record = Price.create!(get_price_params)
        render json: { status: 'created', price_id: record.id}, status: 201
      rescue => e
        render json: e, status: 400
      end
    end
  end

  def update_price
    ActiveRecord::Base.transaction do
      begin
        record = Price.find(get_price_id_param)
        record.update!(get_price_params)

        render json: { status: 'updated', price_id: record.id}, status: 201
      rescue => e
        render json: { error: e}, status: 400
      end
    end
  end

  def remove_price
    ActiveRecord::Base.transaction do
      begin
        record = Price.find(get_price_id_param)
        record.delete

        render json: { status: 'deleted'}, status: 201
      rescue => e
        render json: {error: e}, status: 400
      end
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
