class ApplicationController < ActionController::Base

  def connect
    before_action :authenticate_user!
  end

end
