class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :access_token
  
  def generate_temporary_authentication_token
    self.create_access_token(access_token: Devise.friendly_token)
  end

  def clear_temporary_authentication_token
     self.access_token.delete
  end       
end
