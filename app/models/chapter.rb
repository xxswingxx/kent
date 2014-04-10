class Chapter < ActiveRecord::Base
  belongs_to :comic
  has_many :pages, order: 'number ASC, id ASC'

  attr_accessor :file
end