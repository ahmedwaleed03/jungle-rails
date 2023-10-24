class User < ApplicationRecord
  has_secure_password

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, :uniqueness => { :case_sensitive => false }
  validates :password, length: { minimum: 6 }
  validate :password_confirmation_match

  def password_confirmation_match
    if password != password_confirmation
      errors.add(:password_confirmation, "must match the password")
    end
  end

  def self.authenticate_with_credentials(email, password)
    # Remove leading and trailing whitespaces and put it in all lowercase
    email = email.strip.downcase

    user = User.find_by(email: email)

    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end
end
