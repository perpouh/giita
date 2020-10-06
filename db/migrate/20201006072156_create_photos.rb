class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.integer :article_id # 記事削除の時に画像も消したい
      t.string :image
      t.timestamps
    end
  end
end
