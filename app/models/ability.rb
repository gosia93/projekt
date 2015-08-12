class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user
    can :read, [Volonteer, Organisation, Individual]
    can :search, [Volonteer, Individual]
    cannot :show, [Volonteer, Organisation, Individual]
    if user.admin?
        can :manage, [ Role, VolontaryType, Comment, User]
    elsif user.is_volonteer? 
        can :read, [Organisation, Individual, Volonteer, Comment]
        can :manage, [Volonteer, Comment]
        can :search, [Organisation, Individual]
        can :show, [Organisation, Individual]
        cannot :edit, [Organisation, Individual]
       
    elsif user.is_organisation?
        can :read, [ Volonteer, Comment, Individual]
        can :search, [Volonteer, Organisation, Individual]
        can :manage, [Organisation, Comment]
        can :show, [Volonteer]
        cannot :show, [Organisation, Individual]
        cannot :edit, [Individual, Volonteer]

    elsif user.is_individual?
        can :read, [ Volonteer, Comment, Organisation]
        can :search, [Volonteer, Organisation]
        can :manage, [Individual, Comment, Volonteer]
        can :show, [Volonteer]
        cannot :show, [Organisation, Individual]
        cannot :edit, [Organisation, Volonteer]
    end
  end
end
 