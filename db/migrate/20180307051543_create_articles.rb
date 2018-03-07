class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string    :title
      t.text     :image_url
      t.text     :introduction
      t.text     :work_content
      t.string   :reward
      t.text     :other_reward
      t.text     :requirements
      t.string   :num_people
      t.string   :travel_period
      t.string   :area
      t.string   :company
      t.text     :other
      t.text     :application_deadline
      t.text     :responsible_party_icon
      t.text     :single_word
      t.timestamps
    end
  end
end
