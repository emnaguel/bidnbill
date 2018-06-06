class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @conversation = Conversation.find(params[:conversation_id])
    @messages = @conversation.messages
    @message.conversation = @conversation
    @message.sender = current_user
    authorize @message
    @message.save
    respond_to do |format|
      format.html { redirect_to conversation_path(@conversation) }
      format.js
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
