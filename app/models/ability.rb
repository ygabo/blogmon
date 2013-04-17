class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    end
    
    can :read, :all
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
