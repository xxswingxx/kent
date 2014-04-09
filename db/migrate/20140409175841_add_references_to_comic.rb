class AddReferencesToComic < ActiveRecord::Migration
  def change
  	add_column :comics, :author, :string
  	add_column :comics, :user_id, :integer
  	add_index :comics, :user_id
  end
end
