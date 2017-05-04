class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :runtime
      t.string :genre
      t.string :director
      t.string :released
      t.string :title
      t.string :imgsrc
      t.timestamps null: false
    end
  end
end
