class MessagePolicy < ApplicationPolicy
  def create?
    if user.user_type == "client"
      return  record.conversation.client == user && record.client.user_type == "client"
    else
      return record.conversation.provider == user && record.provider.user_type == "provider"
    end
  end

  def new?
    create?
  end

  class Scope < Scope
    def resolve
      if user.user_type == "client"
        scope.all
      else
        scope.where(user_id: user.id)
      end
    end
  end
end
