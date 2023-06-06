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
      create?
    end

    def create?
      true
    end

    def update?
      record.user == user
    end
  end
end
