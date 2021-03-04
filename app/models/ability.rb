# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)


    user ||= User.new # guest user (not logged in)
    if user.superadmin_role?
      can :manage, :all
    end
    if user.contributor_role?
      can :manage, Restaurant
    end
    if user.user_role?
      can :manage, Restaurant
    end
  end
end
