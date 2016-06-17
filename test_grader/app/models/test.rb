class Test < ActiveRecord::Base
  belongs_to :answer_key
  has_many :sections
  has_many :answers, :through => :sections
  has_many :responses
  has_many :users, :through => :responses
 
  accepts_nested_attributes_for :responses


  def self.format
    format = {:english => 75, :math => 60, :reading => 40, :science => 40}
    
  end


  def responses_attributes=(responses_attributes)
 
    responses_attributes.each do |r|
      response = Response.create(user_id: self.user_id, answer_key_id: self.answer_key_id, answer_choice: r[1][:answer_choice].upcase)
      if  (0..74).include?(r[0].to_i)
        response.question = r[0].to_i + 1
        response.section = Section.find_by(answer_key_id: self.answer_key_id, title: 'english')

      elsif (75..134).include?(r[0].to_i)
        response.question = r[0].to_i + 1 - 75
        response.section = Section.find_by(answer_key_id: self.answer_key_id, title: 'math')
      elsif (135..174).include?(r[0].to_i)
        response.question = r[0].to_i + 1 - 135
        response.section = Section.find_by(answer_key_id: self.answer_key_id, title: 'reading')
      elsif (175..214).include?(r[0].to_i)
        response.question = r[0].to_i + 1 - 175
        response.section = Section.find_by(answer_key_id: self.answer_key_id, title: 'science')
      end
      self.responses << response
      response.save
      if !self.sections.include?(response.section)
        self.sections << response.section
      end
      

    end




  end



  def section_score(section, test)
    section = test.sections.where(title: 'section')
    answers = Answers.where(section_id: section.first.id, answer_key_id: test.answer_key.id)

    score = 0
    section.each do |s|
      a = answers.find_by(question: s.question)
      if s.answer_choice == s.answer_choice
        score += 1
      end
    end
  end












end
