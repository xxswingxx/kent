class CreateChapter < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
    	t.references :comic
    	t.string :cover
    	t.string :title
    	t.string :issue
    	t.boolean :locked
    	t.float :score
    end
    add_index :chapters, :comic_id
  end
end
