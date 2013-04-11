class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.integer :votes, :default=>0
      t.references :user
      t.references :post
      t.timestamps
    end
  end
end
