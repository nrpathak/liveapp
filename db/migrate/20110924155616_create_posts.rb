class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :post_desc
      t.integer :votes_count
      t.integer :creator_id
      t.integer :weight
      t.integer :reply_id

      t.timestamps
    end
  end
end
