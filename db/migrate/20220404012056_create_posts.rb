class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :postal_code
      t.string :address
      t.float :longitude
      t.float :latitude
      t.string :title
      t.text :introduction
      t.float :atmosphere_rate
      t.float :few_people_rate
      t.float :standard_rate
      t.float :all_rate
      t.float :confession_result
      t.integer :area_id

      t.timestamps
    end
  end
end
