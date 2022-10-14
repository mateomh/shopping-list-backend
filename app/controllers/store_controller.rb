class StoreController < ApplicationController
  def get_all_stores
    records = Store.all
    response = HashWithIndifferentAccess.new({
      stores: records
    })
    render json: response, status: 200
  end

  def get_single_store
    begin
      record = Store.find(get_store_id_param)
      response = ActiveSupport::HashWithIndifferentAccess.new({
        store: record
      })
      render json: response, status: 200
    rescue => e
      render json: { error: e }, status: 400
    end
  end
  
  def create_store
    ActiveRecord::Base.transaction do
      begin
        record = Store.create!(get_store_params)
        render json: { status: 'created', store_id: record.id}, status: 201
      rescue => e
        render json: e, status: 400
      end
    end
  end

  def update_store
    ActiveRecord::Base.transaction do
      begin
        record = Store.find(get_store_id_param)
        record.update!(get_store_params)

        render json: { status: 'updated', store_id: record.id}, status: 201
      rescue => e
        render json: { error: e}, status: 400
      end
    end
  end

  def remove_store
    ActiveRecord::Base.transaction do
      begin
        record = Store.find(get_store_id_param)
        record.delete

        render json: { status: 'deleted'}, status: 201
      rescue => e
        render json: {error: e}, status: 400
      end
    end
  end

  private

  def get_store_id_param
    params.permit(:id)[:id]
  end

  def get_store_params
    params.require(:store).permit(:name, :location, :logo_url)
  end
end
