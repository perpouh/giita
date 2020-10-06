class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :public_uid
      t.integer :user_id
      t.string :title
      t.string :body
      t.timestamps
    end
    add_index :articles, :public_uid, unique: true
  end
end
