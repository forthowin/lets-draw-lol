class CreateDrawings < ActiveRecord::Migration
  def change
    create_table :drawings do |t|
      t.string :image
      t.integer :picture_id
      t.timestamps
    end
  end
end
