class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can manage:, :all
    elsif user.super_admin?
      can manage:, :all
    else 
      can :manage, :all
      cannot :update_role, User
    end
  end
end
