# frozen_string_literal: true

class User < ApplicationRecord
  before_save { self.email = email.downcase }

  has_secure_password


  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true

  has_many :posts
end
