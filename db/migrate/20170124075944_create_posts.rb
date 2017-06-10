class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|

      t.string :title,      null: false
      t.text :content,      null: false
      t.integer :cost,    default: 0
      t.integer :upcount,    default: 0
      t.string :image_url,  default: ""
      # t.integer :user_id,   null: false
      
      t.timestamps null: false
    end
  end
end
