class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    CompositionEngine.extract_user_from_session(session)
  end
end
