class Ability
  include CanCan::Ability

  def initialize user
    if user
      cannot :access, :all
    end
  end
end
