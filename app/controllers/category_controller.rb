class CategoryController < ApplicationController
  def get_all_categories
    begin
      result = Categories::GetAllCategories.run!
      render json: {
        categories: result
      },  status: 200
    rescue => e
      render json: { Error: e }, status: 400
    end
  end

  def get_single_category
    begin
      result = Categories::GetCategoryInfo.run!(
        category_id: get_category_id_param
      )

      render json: result, status: 200
    rescue => e
      render json: { error: e }, status: 400
    end
  end

  def create_category
    begin
      result = Categories::CreateCategory.run!(
        name: get_category_params[:name],
        description: get_category_params[:description]
      )

      render json: { status: 'created', cartegory_id: result.id}, status: 201
    rescue => e
      render json: e, status: 400
    end
  end

  def update_category
    begin
      result = Categories::UpdateCategory.run!(
        category_id: get_category_id_param,
        category_information: get_category_params
      )

      render json: { status: 'updated', cartegory_id: result.id}, status: 201
    rescue => e
      render json: { params: get_category_params, error: e}, status: 400
    end
  end

  def remove_category
    begin
      Categories::DeleteCategory.run!(
        category_id: get_category_id_param
      )

      render json: { status: 'deleted'}, status: 201
    rescue => e
      render json: {error: e}, status: 400
    end
  end

  private

  def default_response
    return { status: 'work in progress', id: get_category_id_param }
  end

  def get_category_id_param
    params.permit(:id)[:id]
  end

  def get_category_params
    params.require(:category).permit(:name, :description)
  end
end
