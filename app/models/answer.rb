class Answer < ActiveRecord::Base
  attr_accessible :body, :comment_id, :user_id

  belongs_to :user
  belongs_to :comment

  def author
    user.email
  end
end
