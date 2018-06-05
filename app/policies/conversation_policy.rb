class ConversationPolicy < ApplicationPolicy
  def show?
    if user.user_type == "client"
      return scope.where(:id => record.id).exists? && record.client == user && record.client.user_type == "client"
    else
      return scope.where(:id => record.id).exists? && record.provider == user && record.provider.user_type == "provider"
    end
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
