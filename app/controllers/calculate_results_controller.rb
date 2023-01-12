class CalculateResultsController < ApplicationController
  def generate_store_list
    begin
      response =CalculateResults::GenerateStoreListService.run!(
        product_ids: get_product_ids
      )
      
      render json: response, status: 200
    rescue => e
      render json: { error: e }, status: 400
    end
  end

  private

  def get_product_ids
    # params.permit(:product_ids => [])[:product_ids]
    params.require(:product_ids)
  end
end
