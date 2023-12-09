class ApplicationController < ActionController::Base
    protect_from_forgery

  def access_denied(exception)
    redirect_to admin_projects_path, alert: exception.message
  end
    # load_and_authorize_resource

    # rescue_from CanCan::AccessDenied do |exception|
    #     exception.default_message = "You are not authorized to perform this task"
    #     respond_to do |format|
    #       format.json { head :forbidden }
    #       format.html { redirect_to root_path, alert: exception.message }
    #     end
    #   end
end
