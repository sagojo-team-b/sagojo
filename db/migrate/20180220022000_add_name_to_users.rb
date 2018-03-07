class AddNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :Users, :name, :string, null: false, unique: true
    add_column :Users, :magazine, :integer, null: false
  end
end
