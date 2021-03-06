class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    if params['token']
      build = Build.new(params['token'])
      @master_frontend = build.master_frontend
      @recent = build.recent
    end
  end
end
