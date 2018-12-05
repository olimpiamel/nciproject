class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home
    render html: "CHAMBERS"
  end

  include SessionsHelper

  include ConversationsHelper

  helper_method :mailbox, :conversation

  private
    def set_user
      unless current_user
      flash[:danger] = "Please log in"
      redirect_to(login_url)
      end
    end

    def mailbox
      @mailbox = current_user.mailbox
    end

    def conversation
      @conversation = mailbox.conversations.find(params[:id])
    end



end
