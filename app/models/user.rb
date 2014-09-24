class User < ActiveRecord::Base
  before_save { email.downcase! }

  validates :name, presence: true, 
                   length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password 
  #1) Creates :password and :password_confirmation (virtual) attributes, 
  #which I think are real attributes in the User class, but do not
  #correspond to columns in the db;
  #2) Creates authenticate() method
  #3) Creates presence validation for password 
  
  validates :password, length: { minimum: 6 }
end
