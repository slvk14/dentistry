require './lib/errors/error_handling.rb'
require './lib/errors/custom_error.rb'

class ApplicationController < ActionController::API
  include ActionController::RequestForgeryProtection
  include Error::ErrorHandling

  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token

  def raise_custom_error(error_message)
    raise Error::CustomError.new(error_message, 400)
  end
end
