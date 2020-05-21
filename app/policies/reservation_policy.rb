class ReservationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.reservations
    end
  end

  def create?
    true
  end

  def update?
    record.babysitter.user = user
  end
end
