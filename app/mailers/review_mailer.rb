class ReviewMailer < ApplicationMailer
  def review_mailer(rest)
     @restaurant= rest
      mail to: @restaurant.user.email,  subject: "Inquiry email confirmation"
   end
end
