class User < ActiveRecord::Base

  has_many :responses
  has_many :tests, :through => :responses
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:normal, :tutor, :admin]
end
