class StoreController < ApplicationController
  def get_all_stores
    begin
      result = Stores::GetAllStores.run!

      render json: result, status: 200
    rescue => e
      render json: { error: e }, status: 400
    end
  end

  def get_single_store
    begin
      result = Stores::GetStore.run!(
        store_id: get_store_id_param
      )

      render json: result, status: 200
    rescue => e
      render json: { error: e }, status: 400
    end
  end
  
  def create_store
    begin
      result = Stores::CreateStore.run!(
        name: get_store_params[:name],
        location: get_store_params[:location],
        logo_url: get_store_params[:logo_url]
      )

      render json: { status: 'created', store_id: result.id}, status: 201
    rescue => error
      render json: error, status: 400
    end
  end

  def update_store
    begin
      result = Stores::UpdateStore.run!(
        store_id: get_store_id_param,
        store_information: get_store_params
      )

      render json: { status: 'updated', store_id: result.id}, status: 201
    rescue => e
      render json: { error: e }, status: 400
    end
  end

  def remove_store
    begin
      Stores::DeleteStore.run!(
        store_id: get_store_id_param
      )
      
      render json: { status: 'deleted'}, status: 201
    rescue => e
      render json: {error: e}, status: 400
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
