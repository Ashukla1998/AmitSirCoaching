class ContactUs < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true
  validate :valid_email_format
  validates :number, presence: true, length: { minimum: 10, maximum: 15 }
  validates :message, presence: true, length: { minimum: 10 }

  before_save :sanitize_email

  private

  def sanitize_email
    self.email = email.downcase.strip
  end

  def valid_email_format
    unless /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.match?(email)
      errors.add(:email, "is not in a valid format")
    end
  end
end
