class Test < ActiveRecord::Base
  belongs_to :answer_key

  
  has_many :responses
  belongs_to :user


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
      
      

    end
 


  end













end
