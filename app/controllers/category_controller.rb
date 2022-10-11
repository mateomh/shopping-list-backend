class CategoryController < ApplicationController
  def get_all_categories
    categories = Category.all
    render json: {
      categories: categories
    }
  end

  def get_single_category
    begin
      record = Category.find(get_category_id_param)
      render json: { category: record }, status: 200
    rescue => e
      render json: { error: e }, status: 400
    end
  end

  def create_category
    begin
      record = Category.create!(get_category_params)
      render json: { status: 'created', cartegory_id: record.id}, status: 201
    rescue => e
      render json: e, status: 400
    end
  end

  def update_category
    begin
      record = Category.find(get_category_id_param)
      record.update!(get_category_params)

      render json: { status: 'updated', cartegory_id: record.id}, status: 201
    rescue => e
      render json: { params: get_category_params, error: e}, status: 400
    end
  end

  def remove_category
    begin
      record = Category.find(get_category_id_param)
      record.delete

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
