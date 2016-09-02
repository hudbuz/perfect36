class User < ActiveRecord::Base
  has_many :tests
  has_many :responses, through: :tests
  
  has_many :students, class_name: "User",
                          foreign_key: "tutor_id"
 
  belongs_to :tutor, class_name: "User"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :omniauthable, :omniauth_providers => [:google_oauth2, :facebook]

  enum role: [:normal, :tutor, :admin]

  def taken_test?

    codes = []
    self.try(:tests).each do |x|
      
      codes << x.answer_key.code
    end
    not_taken = []
    keys = AnswerKey.all

    keys.each do |k|
      if !codes.include?(k.code)
        not_taken << k
      end
    end


    not_taken

  end


  def self.from_omniauth(access_token)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
     user.email = auth.info.email
     user.password = Devise.friendly_token[0,20]
   end
end
end



