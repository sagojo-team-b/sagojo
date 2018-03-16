class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.references    :user, null: false
      t.string        :avatar
      t.string        :background_image
      t.string        :catch_phrase
      t.integer       :birth_date_y
      t.integer       :birth_date_m
      t.integer       :birth_date_d
      t.integer       :sex
      t.integer       :tel
      t.integer       :post_number
      t.string        :address1
      t.string        :address2
      t.string        :address3
      t.string        :address4
      t.string        :present_place
      t.string        :private_link
      t.integer       :pv
      t.string        :sns
      t.integer       :follower
      t.integer       :job_type_tags_1
      t.integer       :job_type_tags_2
      t.integer       :job_type_tags_3
      t.integer       :job_type_tags_4
      t.text          :job_type_else
      t.text          :language
      t.text          :job_history
      t.text          :travel_history
      t.integer       :skill_tags_1
      t.integer       :skill_tags_2
      t.integer       :skill_tags_3
      t.integer       :skill_tags_4
      t.text          :skill_tags_else
      t.text          :achievement
      t.string        :income
      t.text          :preparation
      t.string        :travel_date
      t.text          :travel_content
      t.text          :self_introduction

      t.timestamps
    end
  end
end
