class AddPostTitletoPost < ActiveRecord::Migration
  def up
    add_column :Posts, :post_title, :string
  end

  def down
  end
end
