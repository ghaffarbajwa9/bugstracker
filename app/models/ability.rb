# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.manager?
      can :manage, User
      can :manage, Project
      can :manage, Bug
    end 
    if user.developer?
      can :read, Project, users:{id: user.id}
      can :read, Bug
      can :update, Bug
    end
    if user.qa?
      can :read, Project
      can :read, Bug
      can :create, Bug
    end 
  end
end
