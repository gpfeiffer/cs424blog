class Comment < ActiveRecord::Base
  attr_accessible :article_id, :body, :title, :user_id

  belongs_to :article
  belongs_to :user

  def author
    user.email
  end
end
