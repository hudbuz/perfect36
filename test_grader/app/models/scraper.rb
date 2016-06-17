class Scraper

  def davinci_code(path)



    doc = Nokogiri::HTML(open(path))
    #####2015-16, all of the old test models have the same div ids so they only ones that will need special treatment are the newest ones
    answer_hash = doc.css("div#pf39 div.pc39 div.t").count
    answer_page.each do |answer|
      if 
    binding.pry


  end




end