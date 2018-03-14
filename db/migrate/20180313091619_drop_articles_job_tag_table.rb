class DropArticlesJobTagTable < ActiveRecord::Migration[5.0]
  def up
    drop_table :articles_job_tags
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
