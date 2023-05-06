class User < ApplicationRecord
  has_secure_password

  EMAIL_REGEXP = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email, :first_name, :last_name, :password, presence: true
  validates :email, format: EMAIL_REGEXP

  enum access_level: {admin: 0, operations: 1}
end
