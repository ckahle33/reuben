class AddContentToArticleBlocks < ActiveRecord::Migration[5.0]
  def up
    add_column :article_blocks, :content, :text
  end

  def down
    remove_column :article_blocks, :content, :text
  end
end
