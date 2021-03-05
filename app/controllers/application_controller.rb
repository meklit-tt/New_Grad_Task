class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #load_and_authorize_resource

  rescue_from CanCan::AccessDenied do
    redirect_to root_path
  end


end
