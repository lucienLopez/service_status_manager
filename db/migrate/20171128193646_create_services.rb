class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.string :name
      t.string :url
      t.boolean :is_up, default: false
    end
  end
end
