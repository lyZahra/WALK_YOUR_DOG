class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end

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
      record.user == user
    end
  end
end
