class AnswerKey < ActiveRecord::Base
  has_many :sections
  has_many :answers
  has_many :tests

  accepts_nested_attributes_for :answers


  def self.format
    format = {:english => 75, :math => 60, :reading => 40, :science => 40}
    
  end


  def answers_attributes=(answers_attributes)
 
    answers_attributes.each do |r|
      answer = Answer.create(answer_key_id: self.id, correct_answer: r[1][:correct_answer].upcase)
      if  (0..74).include?(r[0].to_i)
        answer.question = r[0].to_i + 1
        answer.section = Section.find_or_create_by(answer_key_id: self.id, title: 'english')

      elsif (75..134).include?(r[0].to_i)
        answer.question = r[0].to_i + 1 - 75
        answer.section = Section.find_or_create_by(answer_key_id: self.id, title: 'math')
      elsif (135..174).include?(r[0].to_i)
        answer.question = r[0].to_i + 1 - 135
        answer.section = Section.find_or_create_by(answer_key_id: self.id, title: 'reading')
      elsif (175..214).include?(r[0].to_i)
        answer.question = r[0].to_i + 1 - 175
        answer.section = Section.find_or_create_by(answer_key_id: self.id, title: 'science')
      end
      self.sections << answer.section
      self.answers << answer
      answer.save
   
      
      
      end

    end


end
