class Scraper

  def davinci_code(path, name, url)

    code = name
    location = url

    doc = Nokogiri::HTML(open(path))


    answers = doc.css("div#page-container").first.css('div.t')
    key = AnswerKey.create(code: code, url: location)
    key.sections.build(title: 'english').save
    key.sections.build(title: 'math').save
    key.sections.build(title: 'reading').save
    key.sections.build(title: 'science').save


    answers.each do |a|
      if !a.first.last.include?('fc0')
      if a.children.text.to_i > 0
      r = Answer.new(answer_key_id: key.id)
      if a.first.last.include?('x2') || a.first.last.include?('x11') || a.first.last.include?('x1 ') || a.first.last.include?('x4 ')
        r.section = key.sections.where(title: 'english').first
        r.question = a.children.text.to_i
        r.save
      elsif a.first.last.include?('x6') || a.first.last.include?('8 ') || a.first.last.include?('x3')
        r.section = key.sections.where(title: 'math').first
        r.question = a.children.text.to_i
        r.save
      elsif a.first.last.include?('xa ') || a.first.last.include?('xf ')
      r.section = key.sections.where(title: 'reading').first
        r.question = a.children.text.to_i
        r.save
      elsif a.first.last.include?('xc') || a.first.last.include?('x10 ')
        r.section = key.sections.where(title: 'science').first
        r.question = a.children.text.to_i
        r.save
      end

      else

        problems = ["L", "O", "V", "I"]
        r = Answer.last
        if !problems.include?(a.children.text)


          r.update(correct_answer: a.children.text)
          r.save
        end
      end
    end
  end






  end




end
