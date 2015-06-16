class AddCategoryIdToDrawings < ActiveRecord::Migration
  def change
    add_column :drawings, :category_id, :integer
  end
end
