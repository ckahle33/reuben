class CreateArticleBlock < ActiveRecord::Migration[5.0]
  def change
    create_table :article_blocks do |t|
      t.integer :article_id
      t.integer :order
      t.integer :width
    end
  end
end
