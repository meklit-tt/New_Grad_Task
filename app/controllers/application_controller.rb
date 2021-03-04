class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do
    redirect_to root_path
  end

   #before_action :authenticate_user!

end
