class CreatePings < ActiveRecord::Migration[5.1]
  def change
    create_table :pings do |t|
      t.string :is_up
      t.integer :service_id

      t.timestamps
    end

    add_foreign_key :pings, :services
    add_index :pings, [:service_id, :updated_at]
  end
end
