class Comic < ActiveRecord::Base
  
  belongs_to :user
  has_many :chapters,  order: 'issue ASC, id ASC'

  mount_uploader :thumbnail, ThumbnailUploader

  validates_presence_of :title, :description
end
