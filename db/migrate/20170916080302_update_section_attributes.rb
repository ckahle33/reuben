class UpdateSectionAttributes < ActiveRecord::Migration[5.0]
  def up
    remove_column :sections, :width, :string
  end

  def down
    add_column :sections, :width, :string
  end
end
