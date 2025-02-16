class AddDefaultToStatusInOrders < ActiveRecord::Migration[8.0]
  def change
    change_column_default :orders, :status, 0  # Setting default to 0 (received)
  end
end
