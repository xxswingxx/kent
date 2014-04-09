class CreatePage < ActiveRecord::Migration
  def change
    create_table :pages do |t|
    	t.string :image
    	t.string :number
    	t.references :chapter
    end
    add_index :pages, :chapter_id
  end
end
