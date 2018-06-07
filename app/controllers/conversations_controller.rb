class ConversationsController < ApplicationController
  def show
    @conversation = Conversation.find(params[:id])
    authorize @conversation
    @messages = @conversation.messages
    @message = Message.new
  end

  def index
    @conversations = policy_scope(Conversation).order(created_at: :asc)
    @auctions = []
    @conversations.each do |conv|
      unless @auctions.include? conv.auction
        @auctions << conv.auction
      end
    end
  end
end

