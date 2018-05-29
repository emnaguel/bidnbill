class BillPolicy < ApplicationPolicy
  def show?
    scope.where(:id => record.id).exists? && record.client == user && record.client.user_type == "client"
  end

  def new?
    user.user_type == "client"
  end

  def create?
    new?
  end

  def edit?
    scope.where(:id => record.id).exists? && record.client == user && record.client.user_type == "client"
  end

  def update?
    edit?
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
