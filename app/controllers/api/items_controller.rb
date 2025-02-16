class Api::ItemsController < ApplicationController

  # protect_from_forgery with: :null_session
  before_action :set_item, only: [:show, :update, :destroy]

  # GET /api/items
  def index
    @items = Item.all
    render json: @items
  end

  # GET /api/items/:id
  def show
    render json: @item
  end

  # POST /api/items
  def create
    @item = Item.new(item_params)
    if @item.save
      render json: @item, status: :created
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  private

  # Set the item for show, update, destroy
  def set_item
    @item = Item.find(params[:id])
  end

  # Only allow a list of trusted parameters through
  def item_params
    params.require(:item).permit(:id, :order_id, :title, :amount, :type)  # Adjust item attributes as needed
  end

end
