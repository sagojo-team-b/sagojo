class AddConventionToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :convention, :integer, null: false
  end
end
