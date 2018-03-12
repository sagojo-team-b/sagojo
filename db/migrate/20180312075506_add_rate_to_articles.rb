class AddRateToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :thumbnail, :text
  end
end
