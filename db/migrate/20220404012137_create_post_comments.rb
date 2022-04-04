class CreatePostComments < ActiveRecord::Migration[6.1]
  def change
    create_table :post_comments do |t|
      t.integer :customer_id
      t.integer :post_id
      t.string :title
      t.text :comment
      t.float :atmosphere_rate
      t.float :few_people_rate
      t.float :standard_rate
      t.float :all_rate
      t.float :confession_result

      t.timestamps
    end
  end
end
