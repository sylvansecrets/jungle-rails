class User < ActiveRecord::Base
  has_many :reviews
  has_secure_password

  validates :email, uniqueness: true, case_sensitive: false
  validates :email, presence: true
  validates :preferred_name, presence: true
  validates :formatted_name, presence: true
  validates :password, length: {minimum: 6}
end