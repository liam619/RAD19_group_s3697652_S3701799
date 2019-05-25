class User < ApplicationRecord

  has_many :courses

  VALID_EMAIL_REGEX = /\A[A-z]+\.[A-z]+@rmit.edu.au\z/i
  VALID_PASS_REGEX = /(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*\W)[\w+\W].{7,}+/

  before_save {email.downcase!}
  validates :name, presence: true, length: {in: 4..30}

  validates :email, presence: true, length: {in: 4..50},
            format: {with: VALID_EMAIL_REGEX,
                     message: ' registration only open for RMIT staff & must contain first and last name (first.last@rmit.edu.au)'},
            uniqueness: {case_sensitive: false}

  validates :password, presence: true,
            format: {with: VALID_PASS_REGEX,
                     message: ' must contains at least a lowercase letter, a uppercase, a digit, a special character and 8+ characters'}
  validates :password_confirmation, presence: true

  has_secure_password

  # def User.digest(string)
  #   cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
  # end
end
