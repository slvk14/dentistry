# sending the emails to clients and doctors

class UsersMailer < ApplicationMailer
  default template_path: 'mailers/users_mailers/'

  def send_greeting_email(user_email)
    mail  to: user_email,
          subject: 'HELLO WORLD!',
          template_name: 'greeting_mailer'
  end

  def send_appointment_confirmation_emails(email)
    mail  to: email,
          subject: 'APPOINTMENT CREATED!!!',
          template_name: 'greeting_mailer'
  end
end
