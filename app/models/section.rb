class Section < ActiveRecord::Base
  has_many :answers
  has_many :responses
  belongs_to :test
  belongs_to :answer_key

  def self.preload(test)
    sections = []
    sections << self.create(title: 'english', answer_key_id: test.answer_key_id)
    sections << self.create(title: 'math', answer_key_id: test.answer_key_id)
    sections << self.create(title: 'reading', answer_key_id: test.answer_key_id)
    sections << self.create(title: 'science', answer_key_id: test.answer_key_id)
    sections



  end
end
