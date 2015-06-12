class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :name, null: false
      t.string :image, null: false
      t.integer :category_id, null: false
      t.timestamps
    end
  end
end
