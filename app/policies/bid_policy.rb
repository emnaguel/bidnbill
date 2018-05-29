class BidPolicy < ApplicationPolicy
   def create?
    return true
    end

    def update?
      record.provider == user
    # - record: the restaurant passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
    end

    def destroy?
      record.provider == user
    end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
