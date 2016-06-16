class AnswerKey < ActiveRecord::Base
  has_many :sections
  has_many :answers, :through => :sections
  has_many :tests
end
