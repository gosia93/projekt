class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user
    cannot :read, Volonteer
    if user.admin?
        can :manage, [ Role, VolontaryType, Comment, User]
    elsif user.is_volonteer? 
        can :read, [Organisation, Individual]
       
    elsif user.is_organisation?
        can :read, [Volonteer]

    elsif user.is_individual?
        can :read, [Volonteer]
       
    end
  end
end
