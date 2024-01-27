class ContactUsMailer < ApplicationMailer
    default from: 'your_email@example.com' 
    def contact_email(user)
      @user = user
      mail(to:'tomaramitsingh19@gmail.com', subject: 'New Contact Form Submission')
    end
  end