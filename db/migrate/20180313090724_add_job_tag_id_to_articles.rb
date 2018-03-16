class AddJobTagIdToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :job_tag_id, :integer
  end
end
