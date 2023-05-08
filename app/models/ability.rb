# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.operations?
      can :manage, Product
      can :manage, Category
    elsif user.admin?
      can :manage, Product
      can :manage, Category
      can :manage, User
    end
  end
end
