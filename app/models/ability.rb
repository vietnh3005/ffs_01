class Ability
  include CanCan::Ability

  def initialize staff
    if staff.class == Staff
      if staff.position == "admin"
        can :manage, :all
      elsif staff.position == "owner"
        can :read, Staff
        can :manage, Order
      else
        cannot :access, :all
      end
    end
  end
end
