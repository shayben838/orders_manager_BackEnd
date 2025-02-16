class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    # TODO: Add constraints/ default (Null/ Not null/ etc)
    create_table :orders do |t|
      t.string :title
      t.float :latitude
      t.float :longitude
      t.timestamp :order_time
      t.integer :status
      t.timestamp :deleted_at

      t.timestamps
    end
  end
end
