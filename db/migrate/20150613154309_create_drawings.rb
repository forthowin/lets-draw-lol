class CreateDrawings < ActiveRecord::Migration
  def change
    create_table :drawings do |t|
      t.string :image
      t.integer :picture_id, null: false
      t.timestamps
    end
  end
end
