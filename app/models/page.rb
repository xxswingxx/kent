class Page < ActiveRecord::Base
  belongs_to :chapter, dependent: :destroy
  mount_uploader :image, PageUploader
end