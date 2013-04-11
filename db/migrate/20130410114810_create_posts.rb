class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.string :url
      t.integer :votes, :default=>0
      t.integer :comment_count, :default=>0
      t.references :user
      t.timestamps
    end
  end
end
