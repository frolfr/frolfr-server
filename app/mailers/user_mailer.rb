class UserMailer < ApplicationMailer
  default from: "admin@frolfr.com"

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Frolfr - Password Reset"
  end
end
