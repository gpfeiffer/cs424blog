class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.admin? 
      can :manage, :all
    else
      can [:create, :read], [Article, Comment, Answer]
      can :update, Article do |article|
        article.user == user
      end
      can :destroy, Article do |article|
        article.user == user
      end
      can :update, Comment do |comment|
        comment.user == user
      end
      can :destroy, Comment do |comment|
        comment.user == user || comment.article.user == user
      end
      can :update, Answer do |answer|
        answer.user == user
      end
      can :destroy, Answer do |answer|
        answer.user == user || answer.comment.user == user
      end
    end
  end
end
