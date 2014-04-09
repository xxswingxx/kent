class ComicObserver < ActiveRecord::Observer
	
  def before_save(comic)
  	true
  end
end