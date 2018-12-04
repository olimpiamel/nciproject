class HelpsController < ApplicationController

  def index
    format.html {redirect_to :action => "create"}
    format.xml {render :xml => @help.errors, :status => :unprocessable_entity}
  end

  def new
    @help = Help.new
  end

  def create
    @help = Help.new(help_params)
    if @help.save
      @user = current_user
      StaticPagesHelpMailer.help_form_email(@user).deliver
    end
  end

  private

    def help_params
      params.permit(:issue, :description)
    end
end
