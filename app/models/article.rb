class Article < ActiveRecord::Base
  attr_accessible :body, :published_on, :title, :user_id

  has_many :comments
  belongs_to :user

  default_scope :order => :published_on

  def author
    user.email
  end
end
