class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :runtime
      t.string :genre
      t.string :director
      t.string :released
      t.string :title
      t.string :imgsrc
      t.string :review, array: true, default: []
      
      t.timestamps null: false
    end
  end
end



