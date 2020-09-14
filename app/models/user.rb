class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
         validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
         
         with_options presence: true do
          validates :name
      
          VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i
          validates :password, format: { with: VALID_PASSWORD_REGEX }, unless: -> { password.blank? }
        end
end
