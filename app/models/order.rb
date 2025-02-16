#  id: nil,
#  title: nil,
#  latitude: nil,
#  longitude: nil,
#  order_time: nil,
#  status: nil,
#  deleted_at: nil,
#  created_at: nil,
#  updated_at: nil

class Order < ApplicationRecord
  # Looks like sqlite3 does not support enum enum status: {received: 0,preparing: 1,ready: 2,en_route: 3,delivered: 4}
  STATUS_OPTIONS = {
    received: 1,
    preparing: 2,
    ready: 3,
    en_route: 4,
    delivered: 5
  }.freeze

  has_many :items
  acts_as_paranoid column: :deleted_at
  has_paper_trail

  after_create_commit :broadcast_order

  private

  def broadcast_order
    # debugger
    ActionCable.server.broadcast("orders_channel", self)
  end

end
