module TestsHelper
  def section_score(test, section)
   
    
    sec = Section.all.includes(:answers).where(title: section, answer_key_id: test.answer_key).first
    
    resp = Test.all.includes(:responses).where(answer_key_id: test.answer_key, id: test.id).first
  

    score = 0
    answers = sec.answers
    resp.responses.where(section_id: sec.id).each do |s|
     
      a = answers.find { |a| a.question == s.question}
      if a.correct_answer == s.answer_choice
        score += 1
      end
    end
    score
  end



  def test_score(test)


    numbers = [75, 60, 40, 40]
    raw = []
    raw << test.english_score
    raw << test.math_score
    raw << test.reading_score
    raw << test.science_score
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


def get_scores(test)

    test.update(:english_score => section_score(test, 'english'))
    test.update(:math_score => section_score(test, 'math'))
    test.update(:reading_score => section_score(test, 'reading'))
    test.update(:science_score => section_score(test, 'science'))
    
    test.update(:total_score => test_score(test))
    

  end




  
      
  

end