class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end

  def after_sign_in_path_for(resource)
    if resource.teacher?
      teachers_path
    else
      students_path
    end
  end
end

