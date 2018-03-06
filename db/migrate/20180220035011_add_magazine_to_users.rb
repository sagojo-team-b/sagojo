class AddMagazineToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :magazine, :integer, null: false
  end
end
