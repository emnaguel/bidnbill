class AuctionPolicy < ApplicationPolicy
  def show?
    if user.user_type == "client"
      return scope.where(:id => record.id).exists? && record.client == user && record.client.user_type == "client"
    else
      return true
    end
  end

  def show_bids?
    if user.user_type == "client"
      return scope.where(:id => record.id).exists? && record.client == user && record.client.user_type == "client"
    else
      return false
    end
  end

  def showprovider?
    true
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
end

