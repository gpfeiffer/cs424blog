class Article < ActiveRecord::Base
  attr_accessible :author, :body, :published_on, :title

  has_many :comments
end
