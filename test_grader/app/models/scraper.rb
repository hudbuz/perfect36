class Scraper

  def davinci_code(path)

    code = path.split("/").last.gsub('.html', '')
    pdf = path.gsub('.html', '.pdf')
    
    doc = Nokogiri::HTML(open(path))

    
    answers = doc.css("div#page-container").first.css('div.t')
    key = AnswerKey.create(code: code, url: pdf)
    key.sections.build(title: 'english').save
    key.sections.build(title: 'math').save
    key.sections.build(title: 'reading').save
    key.sections.build(title: 'science').save
    
    
    answers.each do |a|
      if !a.first.last.include?('fc0')
      if a.children.text.to_i > 0
      r = Answer.new(answer_key_id: key.id)
      if a.first.last.include?('x2') || a.first.last.include?('x4') || a.first.last.include?('x1')
        r.section = key.sections.where(title: 'english').first
        r.question = a.children.text.to_i
        r.save
      elsif a.first.last.include?('x6') || a.first.last.include?('x8') || a.first.last.include?('xe')
        r.section = key.sections.where(title: 'math').first
        r.question = a.children.text.to_i
        r.save
      elsif a.first.last.include?('xa') || a.first.last.include?('xf')
      r.section = key.sections.where(title: 'reading').first
        r.question = a.children.text.to_i
        r.save
      elsif a.first.last.include?('xc') || a.first.last.include?('x10')
        r.section = key.sections.where(title: 'science').first
        r.question = a.children.text.to_i
        r.save
      end
      else
        r = Answer.last
        r.update(correct_answer: a.children.text)
        r.save
      
      end
    end
    end
        
    binding.pry
    #####2015-16, all of the old test models have the same div ids so they only ones that will need special treatment are the newest ones



  end




end