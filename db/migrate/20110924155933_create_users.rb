class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :password
      t.string :first_name
      t.string :last_name
      t.string :admin
      t.integer :post_count
      t.string :email

      t.timestamps
    end
  end
end
