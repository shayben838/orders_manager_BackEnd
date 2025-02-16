# app/channels/orders_channel.rb
class OrdersChannel < ApplicationCable::Channel
  def subscribed
    stream_from "orders_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def received(data)
    # Logic when a client receives data from the channel
    debugger
  end
end
