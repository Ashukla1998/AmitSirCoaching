# app/controllers/contact_us_controller.rb
class ContactUsController < ApplicationController
    def new
      @contact = ContactUs.new
    end
  
    def create
      @contact = ContactUs.new(contact_params)
      if @contact.save
        flash[:success] = 'Message sent successfully!'
        redirect_to contact_us_thank_you_path
      else
        render :new
      end
    end
    private
  
    def contact_params
      params.require(:contact_us).permit(:name, :email, :number, :message)
    end
  end
  