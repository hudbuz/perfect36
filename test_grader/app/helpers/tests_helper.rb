module TestsHelper
  def section_score(test, section)
 
    sec = test.sections.where(title: section)
    binding.pry
    resp = test.responses.where(section_id: sec.first.id)
    
    answers = Answer.all.where( answer_key_id: test.answer_key.id)

    score = 0
    binding.pry
    resp.each do |s|
      a = answers.find_by(question: s.question)
      if a.correct_answer == s.answer_choice
        score += 1
      end
    end
    score
  end

end