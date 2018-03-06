class RemoveMagazineFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :magazine, :integer, null: false
  end
end
