class API::ApplicationController < ActionController::Base
  respond_to :json
  skip_before_filter :verify_authenticity_token

  helper_method :current_user
  helper_method :authenticate_user!

  def current_user
    begin
      @current_user ||= User.find_by_api_key params[:api_key]
    rescue Exception => e
      nil
    end
  end
  def authenticate_user!
    unless current_user
      # head :unauthorized
      render json: {status: 401, message: "Unauthorized. Please send api key in params"}
    end
  end
end
