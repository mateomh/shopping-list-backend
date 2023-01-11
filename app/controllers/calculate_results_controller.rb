class CalculateResultsController < ApplicationController
  def generate_store_list
    CalculateResults::GenerateStoreListService.run!(
      product_ids: get_product_ids
    )
    
    render json: {"result": "ok"}, status: 202
  end

  private

  def get_product_ids
    # params.permit(:product_ids => [])[:product_ids]
    params.require(:product_ids)
  end
end
