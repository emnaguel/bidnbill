class AuctionPolicy < ApplicationPolicy
  def show?
    if user.user_type == "client"
      return scope.where(:id => record.id).exists? && record.client == user && record.client.user_type == "client"
    else
      return true
    end
  end

  def dashboard?
    user.user_type == "provider"
  end

  def create?
    user.user_type == "client"
  end

  def destroy?
    scope.where(:id => record.id).exists? && record.client == user && record.client.user_type == "client"
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end

