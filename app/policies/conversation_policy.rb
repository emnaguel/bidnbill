class ConversationPolicy < ApplicationPolicy
  def show?
    record.client == user || record.provider == user
  end

  class Scope < Scope
    def resolve
      if user.user_type == "client"
        scope.joins(auction: { bill: :client }).where(auctions: { bills: { client: user}})
      elsif user.user_type == "provider"
        scope.where(provider: user)
      end
    end
  end
end

