class ConversationsController < ApplicationController
  def show
    @conversation = Conversation.find(params[:id])
    authorize @conversation
    @messages = policy_scope(@conversation.messages)
  end
end
