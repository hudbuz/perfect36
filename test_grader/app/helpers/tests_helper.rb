module TestsHelper
  def section_score(test, section)
    
    sec = Section.all.includes(:answers).where(title: section, answer_key_id: test.answer_key).first
    
    resp = Test.all.includes(:responses).where(answer_key_id: test.answer_key, id: test.id).first
    binding.pry

    score = 0
   
    resp.responses.where(section_id: sec.id).each do |s|
    
      a = sec.answers.find_by(question: s.question)
      if a.correct_answer == s.answer_choice
        score += 1
      end
    end
    score
  end


  
      
  

end