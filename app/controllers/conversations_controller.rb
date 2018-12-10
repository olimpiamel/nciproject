class ConversationsController < ApplicationController
  before_action :set_user, only: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @conversations = current_user.mailbox.conversations
  end

  def show
    @receipts = conversation.receipts_for(current_user)
    conversation.mark_as_read(current_user)
  end

  def new
    @recipients = User.all - [current_user]
  end

  def create
    recipients = User.where(id: conversation_params[:recipients])
    conversation = current_user.send_message(recipients, conversation_params[:body], conversation_params[:subject]).conversation
    flash[:success] = "Your message has been sent"
    redirect_to conversation_path(conversation)
  end

  def reply
    current_user.reply_to_conversation(conversation, msg_params[:body])
    flash[:notice] = "Your reply has been sent"
    redirect_to conversation_path(conversation)
  end

  def trash
    conversation.move_to_trash(current_user)
    redirect_to mailbox_inbox_path
  end

  def untrash
    conversation.untrash(current_user)
    redirect_to mailbox_inbox_path
  end

  private

  def conversation_params
    params.require(:conversation).permit(:subject, :body, recipients:[])
  end

  def msg_params
    params.require(:message).permit(:body, :subject)
  end

  def conversation
    @conversation = mailbox.conversations.find(params[:id])
  end

  def is_conversation?
    conversation.nil?
  end

end
