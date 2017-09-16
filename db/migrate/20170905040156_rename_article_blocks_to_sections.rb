class RenameArticleBlocksToSections < ActiveRecord::Migration[5.0]
  def change
    rename_table :article_blocks, :sections
  end
end
