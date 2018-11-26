class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home
    render html: "CHAMBERS"
  end

  include SessionsHelper

end
