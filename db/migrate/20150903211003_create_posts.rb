class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :author
      t.string :body
      t.string :category

      t.timestamps null: false
    end
  end
end
