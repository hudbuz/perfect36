class User < ActiveRecord::Base

  has_many :responses
  has_many :tests, :through => :responses
  has_many :students, class_name: "User",
                          foreign_key: "tutor_id"
 
  belongs_to :tutor, class_name: "User"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:normal, :tutor, :admin]
end
