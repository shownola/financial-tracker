class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :set_copyright

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  def set_copyright
    @copyright = ShownolaViewTool::Renderer.copyright 'Shownola | Sherry Wasieko', 'All rights reserved'
  end

  module ShownolaViewTool
    class Renderer
      def self.copyright name, msg
        "&copy; #{Time.now.year} | <b> #{name}</b> #{msg}" .html_safe
      end
    end
  end



end
