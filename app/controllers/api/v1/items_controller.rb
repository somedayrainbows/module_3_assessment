class Api::V1::ItemsController < ApplicationController

  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def create
    item = Item.create(item_params)
    render status: 201, json: {
      message: "Successfully created item.",
      item: item
    }.to_json(:except => [:created_at, :updated_at])
  end

  def destroy
    item = Item.find(params[:id])
    item.delete
    head :no_content
  end

  private

  def item_params
    params.permit(:name, :description, :image_url)
  end

end
