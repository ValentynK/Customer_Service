class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # helper_method :admin?

  # def current_user
   #  @acurrent_user ||= Admin.find(session[:user_id])
  # end

  # protected
  # def admin?
    # current_user.role == "admin"
  # end

  # def authorize
    # unless admin?
      # flash[:notice] = 'Unathirozed access'
      # redirect_to root_path
      # false
    # end
  # end
end
