class AddXpathAndExpectedContentToServices < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :xpath, :text
    add_column :services, :expected_content, :string
  end
end
