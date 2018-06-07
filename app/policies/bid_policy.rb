class BidPolicy < ApplicationPolicy
  def show?
    scope.where(:id => record.id).exists? && (record.client == user || record.provider == user)
  end

  def new?
    user.user_type == "provider"
  end

  def create?
    new?
  end

  def select?
    record.client == user && record.auction.bids.where(status: "completed").empty?
  end

  def pay?
    scope.where(:id => record.id).exists? && record.provider == user && record.provider.user_type == "provider"
  end

  class Scope < Scope
    def resolve
      if user.user_type == "client"
        scope.all
      else
        scope.all
      end
    end
  end
end

