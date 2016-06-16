class Section < ActiveRecord::Base
  has_many :answers
  has_many :responses
  belongs_to :test
  belongs_to :answer_key
end
