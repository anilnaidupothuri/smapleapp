class User < ApplicationRecord 
 before_save { self.email = email.downcase }
 validates :name, :email, presence: true
 validates :password_confirmation, presence: true
 has_secure_password
end 