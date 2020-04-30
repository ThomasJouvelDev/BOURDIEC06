class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
    { locale: I18n.locale }
  end

  # Make sure your production HOST variable is set with your domain name. If you deploy your code with Heroku for instance, just type in your terminal heroku config:set HOST=www.my_product.com
  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
