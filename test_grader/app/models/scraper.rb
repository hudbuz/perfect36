class Scraper

  def davinci_code(path)

    path
    answer_key = AnswerKey.find_or_create_by(code: code)
    doc = Nokogiri::HTML(open(path))
    #####2015-16, all of the old test models have the same div ids so they only ones that will need special treatment are the newest ones
    answer_hash = doc.css("div#pf39 div.pc39 div.t")
    answer_hash.each do |answer|
        if answer.children.first.text.match(/\d+[.]{1}/)
          binding.pry
          answer_key.answers.create(question: answer.children.first.text.match(/\d+[.]{1}/).to_i, correct_answer: 

   

  end
  end




end