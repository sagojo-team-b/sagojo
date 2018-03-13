class CreateTriplabArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :triplab_articles do |t|
      t.text     :image_url
      t.string   :job_type_tag
      t.string   :title
      t.text     :writer_image_url
      t.string   :writer_name
      t.string   :up_date
      t.integer  :view_number
      t.string   :skill_tag_1
      t.string   :skill_tag_2
      t.string   :skill_tag_3
      t.string   :skill_tag_4
      t.timestamps
    end
  end
end
