class RestMailer < ApplicationMailer
  def rest_mailer(rest)
     @restaurant= rest
      mail to: @restaurant.user.admin.email,  subject: "Inquiry email confirmation"
   end
end
