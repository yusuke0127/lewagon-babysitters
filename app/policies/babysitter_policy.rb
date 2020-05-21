class BabysitterPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      User.joins(:babysitter)
    end
  end

  def show?
    true
  end

  def update?
    user = record.user
  end
end
