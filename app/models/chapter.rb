class Chapter < ActiveRecord::Base
  belongs_to :comic
  has_many :pages

  attr_accessor :file
end