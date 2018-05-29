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
    scope.where(:id => record.id).exists? && record.client == user && record.client.user_type == "client"
  end

  def pay?
    scope.where(:id => record.id).exists? && record.provider == user && record.client.user_type == "provider"
  end
end
