class BabysitterPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      User.joins(:babysitter)
    end
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    true
  end
  def update?
    user == record
  end

  def dashboard?
    true
  end
end
