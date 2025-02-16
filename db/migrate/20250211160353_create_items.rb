class CreateItems < ActiveRecord::Migration[8.0]
  def change
    # TODO: Add constraints/ default (Null/ Not null/ etc)
    create_table :items do |t|
      t.references :order, null: false, foreign_key: true
      t.string :title
      t.integer :amount
      t.string :type

      t.timestamps
    end
  end
end
