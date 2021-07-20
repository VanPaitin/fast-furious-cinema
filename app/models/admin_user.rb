class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  validates_presence_of :email

  devise :database_authenticatable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtDenylist
end
