class AddThumbnails < ActiveRecord::Migration
  def change
  	add_column :comics, :thumbnail, :string
  end
end
