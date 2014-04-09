class Comic < ActiveRecord::Base
  
  belongs_to :user
  has_many :chapters

  mount_uploader :thumbnail, ThumbnailUploader

  validates_presence_of :title, :description
end
