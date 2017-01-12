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
         :omniauthable, :omniauth_providers => [:facebook]

  enum role: [:normal, :tutor, :admin]




  def taken_test?
########fix this method; probs should be a scope
    codes = []
    self.try(:tests).where(status: 'complete').each do |x|

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

  def taken_tests
    tests = []
    self.tests.where(status: 'complete').order(:answer_key_id).each do |t|
      tests << t.answer_key
    end
    tests


  end

  def codes
    tests.collect do |a|
      a.answer_key.code
    end
  end


  def self.from_omniauth(auth)

    user = User.find_by(provider: auth.provider, uid: auth.uid)

    if user != nil
      user
    else
      usere = User.find_by(email: auth.info.email)
      if usere != nil
        usere.update(provider: auth.provider, uid: auth.uid)
      else
        User.create(provider: auth.provider, uid: auth.uid, email: auth.info.email,password: auth.credentials.token, name: auth.info.name )

      end
    end
    # where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    #   binding.pry
    #
    #  user.email = auth.info.email
    #  user.password = Devise.friendly_token[0,20]


end
end
