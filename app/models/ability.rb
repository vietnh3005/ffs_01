class Ability
  include CanCan::Ability

  def initialize staff
    if staff.class == Staff
      if staff.position == "admin"
        can :manage, :all
      else
        cannot :access, :all
      end
    end
  end
end
