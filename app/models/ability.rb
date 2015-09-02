class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user
    can :read, [Volonteer, Organisation, Individual]
    cannot :manage, [Volonteer, Organisation, Individual]
    cannot :show, [Volonteer, Organisation, Individual]
    cannot :manage, [SearchOrganisation, SearchVolonteer]
    if user.admin?
        can :manage, [ Role, VolontaryType, Comment, User]
    elsif user.is_volonteer? 
        can :read, [Organisation, Individual, Volonteer, Comment]
        can :manage, [Volonteer, Comment, SearchOrganisation, SearchVolonteer]
        can :search, [Organisation, Individual]
        can :show, [Organisation, Individual]
	can :edit, [Volonteer]
	cannot :show, [Volonteer]
        cannot :edit, [Organisation, Individual]
       
    elsif user.is_organisation?
        can :read, [ Volonteer, Comment, Individual]
        can :search, [Volonteer, Organisation, Individual]
        can :manage, [Organisation, Comment, SearchOrganisation, SearchVolonteer]
        can :show, [Volonteer]
	can :edit, [Organisation]
        cannot :show, [Organisation, Individual]
        cannot :edit, [Individual, Volonteer]

    elsif user.is_individual?
        can :read, [ Volonteer, Comment, Organisation]
        can :search, [Volonteer, Organisation]
        can :manage, [Individual, Comment, Volonteer, SearchOrganisation, SearchVolonteer]
        can :show, [Volonteer]
	can :edit, [Individual]
        cannot :show, [Organisation, Individual]
        cannot :edit, [Organisation, Volonteer]
    end
  end
end
 
