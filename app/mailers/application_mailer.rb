class ApplicationMailer < ActionMailer::Base
  require 'base64'

  default from: 'slavik_dentistry@yahoo.com'

  layout 'mailer'
end
