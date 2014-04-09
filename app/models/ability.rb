class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can :manage, Comic, user_id: user.id
      can :manage, Chapter if can? :manage, Comic
      can :manage, Page if can? :manage, Chapter
    end
    can :read, :all
  end
end