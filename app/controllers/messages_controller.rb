class MessagesController < ApplicationController
  def new
    @message = Message.new
    authorize @message
  end

  def create
    @message = Message.new(message_params)
    @conversation = Conversation.find(params[:conversation_id])
    @message.conversation = @conversation
    @message.sender = current_user
    authorize @message
    if @message.save
      redirect_to conversation_path(@conversation)
    else
      render :new
    end
  end

  private

  def message_params
      params.require(:message).permit(:content)
  end
end
