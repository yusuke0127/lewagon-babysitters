class BabysitterPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      User.joins(:babysitter)
    end
  end

  def show?
    true
  end
end
