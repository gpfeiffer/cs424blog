class Comment < ActiveRecord::Base
  attr_accessible :article_id, :body, :title, :user_id

  belongs_to :article
  belongs_to :user

  has_many :answers, :dependent => :destroy

  def author
    user.email
  end
end
