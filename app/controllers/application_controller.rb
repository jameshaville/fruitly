class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :basket

  def basket
  	unless session[:basket].present?
      session[:basket] = Set.new
    end
    session[:basket]
  end
end
