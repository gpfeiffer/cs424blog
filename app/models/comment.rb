class Comment < ActiveRecord::Base
  attr_accessible :article_id, :author, :body, :title

  belongs_to :article
end
