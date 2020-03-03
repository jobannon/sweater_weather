# class User < ApplicationRecord
class User < ActiveRecord::Base
  validates_presence_of :email, :password
  has_secure_password 
  # has_secure_password :api_token, validations: false

  before_save do
    self.api_token = SecureRandom.urlsafe_base64
  end
end
