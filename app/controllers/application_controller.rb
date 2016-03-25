class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  #Solucionar (para todas las clases) el error: ActionController::InvalidAuthenticityToken
  protect_from_forgery with: :null_session
end
