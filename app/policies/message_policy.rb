class MessagePolicy < ApplicationPolicy
  def create?
    record.conversation.client == user || record.conversation.provider == user
  end
end
