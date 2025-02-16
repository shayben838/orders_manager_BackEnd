class Api::OrdersController < ApplicationController

  before_action :set_order, only: [ :show, :update,  :destroy ]

  # GET /api/orders
  def index
    # debugger
    orders = Order.order(id: :asc)
    render json: {
      orders: orders.as_json,
      status_options: Order::STATUS_OPTIONS,
      last_id: orders.last.id
    }
  end

  # GET /api/orders/:id
  def show
    render json: @order
  end

  # POST /api/orders
  def create
    place_name = Faker::Address.city

    @order = Order.new(
      title: "#{Faker::Food.dish} for #{Faker::Name.first_name} Generated place: #{place_name}",
      status: Order::STATUS_OPTIONS[:received],
      latitude: Faker::Address.latitude,
      longitude: Faker::Address.longitude,
      order_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    )
    if @order.save
      render json: @order, status: :created
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def update
    # PUT /api/orders/:id
    if @order.update(update_order_params)
      render json: @order, status: :ok
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def destroy
  end

  def poll_new_orders
    last_id = params[:last_id].to_i

    # Get orders where the id is greater than the provided last_id
    new_orders = Order.unscoped.where("id > ?", last_id)
    if new_orders
      p "We have new orders!!!! #{new_orders}"
      render json: new_orders, status: :ok
    else
      render json: [], status: :ok
    end
    # TODO: Status OK in both cases?
  end

  private

  # Set the order for show, update, destroy
  def set_order
    @order = Order.find(params[:id])
  end

  # Only allow a list of trusted parameters through
  def order_params
    params.require(:order).permit(:id, :created_at, :updated_at, :title, :latitude, :longitude, :order_time, :status)
  end

    # Only allow a list of trusted parameters through
    def update_order_params
      params.require(:order).permit(:title, :latitude, :longitude, :status)
    end

end
