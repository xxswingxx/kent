class CreateComics < ActiveRecord::Migration
  def change
    create_table :comics do |t|
      t.string :title
      t.string :genre
      t.string :state
      t.text :description
 	  t.string :badge
      t.timestamps
    end
  end
end
