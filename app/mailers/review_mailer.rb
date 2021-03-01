class ReviewMailer < ApplicationMailer
  def review_mailer(view)
     @restaurant= view
      mail to: @restaurant.user.email,  subject: "Inquiry email confirmation"
   end
end
