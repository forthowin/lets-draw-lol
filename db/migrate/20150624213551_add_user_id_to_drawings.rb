class AddUserIdToDrawings < ActiveRecord::Migration
  def change
    add_column :drawings, :user_id, :integer
  end
end
