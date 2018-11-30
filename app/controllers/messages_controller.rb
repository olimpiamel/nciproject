class MessagesController < ApplicationController
  before_action :set_user, only: [:index]
  before_action :set_conversation, only: [:show, :edit, :update, :destroy]

  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @messages = @conversation.messages
    @messages.update_all(read: true)
  end

  def new
    @message = @conversation.messages.new
  end

  def create
    @message = @conversation.messages.new(msg_params)
    if @message.save
      redirect_to conversation_messages_path(@conversation, @messages)
    else
      flash[:danger] = "Your message has not been sent. Please, try again later."
    end
  end

  def destroy
    @message = @conversation.messages.find(params[:id])
    @message.destroy
    flash[:success] = "Your message was deleted."

  private

  def msg_params
    params.require(:message).permit(:body)
  end

end
