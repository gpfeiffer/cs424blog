class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :article_id
      t.string :title
      t.text :body
      t.string :author

      t.timestamps
    end
  end
end
