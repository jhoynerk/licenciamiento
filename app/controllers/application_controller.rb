class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :account_active!
  before_filter :add_allow_credentials_headers

  def add_allow_credentials_headers
    response.headers['Access-Control-Allow-Origin'] = request.headers['Origin'] || '*'
    response.headers['Access-Control-Allow-Credentials'] = 'true'
  end

  def options
    head :status => 200, :'Access-Control-Allow-Headers' => 'accept, content-type'
  end

  private

  def can_access
    redirect_to :back, alert: 'No tienes permiso a esta función del sistema' unless current_user.admin?
  end

  def account_active!
    unless current_user.nil?
      if current_user.status == false
        sign_out current_user
        redirect_to login_path, alert: 'Esta cuenta no se encuentra activa'
        return false
      end
    end
  end
end
