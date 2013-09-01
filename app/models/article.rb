class Article < ActiveRecord::Base
  attr_accessible :author, :body, :published_on, :title
end
