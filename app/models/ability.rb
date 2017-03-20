class Ability
  include CanCan::Ability

  def initialize staff
    if staff.class == Staff
      if staff.admin?
        can :manage, :all
      elsif staff.owner?
        can :read, Staff
        can :manage, Order
      elsif staff.chef?
        can :manage, Order
        can :read, Product
      else
        cannot :access, :all
      end
    end
  end
end
