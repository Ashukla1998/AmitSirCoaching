class ContactUs < ApplicationRecord
    validates :name, presence: true, length: { maximum: 255 }
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :number, presence: true, length: { minimum: 10, maximum: 15 }
    validates :message, presence: true, length: { minimum: 10 }
  
    before_save :sanitize_email
  
    private
    def sanitize_email
      self.email = email.downcase.strip
    end
  end