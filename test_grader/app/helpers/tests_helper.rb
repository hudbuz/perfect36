module TestsHelper
  def section_score(test, section)
    
    sec = Section.all.includes(:answers).where(title: section, answer_key_id: test.answer_key).first
    
    resp = Test.all.includes(:responses).where(answer_key_id: test.answer_key, id: test.id).first
  

    score = 0
   
    resp.responses.where(section_id: sec.id).each do |s|
     
      a = sec.answers.find_by(question: s.question)
      if a.correct_answer == s.answer_choice
        score += 1
      end
    end
    score
  end



  def test_score(test)

    sections = ['english', 'math', 'reading', 'science']
    numbers = [75, 60, 40, 40]
    raw = sections.map do |x| 
      section_score test, x
    end
    scaled = []
    counter = 0
    raw.each do |r|
      
      scaled<< r.to_f/numbers[counter].to_f*36
      counter += 1
    end
    average = scaled.inject(:+)/4
   
    if average.ceil - average > 0.50.to_f
      average.ceil
    else
      average.floor
    end


   



  end


  
      
  

end