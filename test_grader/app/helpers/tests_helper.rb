module TestsHelper
  def section_score(test, section)
 
    answers = Section.where(title: section, answer_key_id: test.answer_key).first.answers
    
    resp = test.responses.where(section_id: answers.first.section_id)
    

    score = 0
   
    resp.each do |s|
    
      a = answers.find_by(question: s.question)
      if a.correct_answer == s.answer_choice
        score += 1
      end
    end
    score
  end

end