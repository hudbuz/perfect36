class Test < ActiveRecord::Base
  belongs_to :answer_key


  has_many :responses
  belongs_to :user


  def self.format
    format = {:english => 75, :math => 60, :reading => 40, :science => 40}

  end




  def responses_attributes=(responses_attributes)

  form = Test.format

  responses_attributes.each do |section|

    test_section = Section.find_by(answer_key_id: self.answer_key_id, title: section[0])

    answers = test_section.answers.order('question ASC')

    section[1].each do |number,resp|

      num = number.to_i - 1
      print num
      if answers[num].correct_answer == resp.upcase
        score = 1
      else
        score = 0
      end
      response = self.responses.build(user_id: self.user_id, answer_key_id: self.answer_key_id, answer_choice: resp.upcase, section: test_section, test: self, question: number, score: score )
      response.save

    end

  end






    end

    def grade_test
      scores = []
      Test.format.each do |key,value|
        s = Section.find_by(title: key.to_s, answer_key_id: self.answer_key_id)
        scores << self.responses.where(score: 1, section: s).count.to_f/s.answers.count.to_f

      end
      scaled = scores.collect do |n|
        n*36
      end

      scores = {}
      average = scaled.inject(:+)/4

      if average.ceil - average > 0.50.to_f
        average = average.ceil
      else
        average = average.floor
      end


      self.english_score = scaled[0]
      self.math_score = scaled[1]
      self.reading_score = scaled[2]
      self.science_score = scaled[3]
      self.total_score = average


      self.save



    end














    # responses_attributes.each do |r|
    #   response = Response.create(user_id: self.user_id, answer_key_id: self.answer_key_id, answer_choice: r[1][:answer_choice].upcase)
    #   if  (0..74).include?(r[0].to_i)
    #     response.question = r[0].to_i + 1
    #     response.section = Section.find_by(answer_key_id: self.answer_key_id, title: 'english')

    #   elsif (75..134).include?(r[0].to_i)
    #     response.question = r[0].to_i + 1 - 75
    #     response.section = Section.find_by(answer_key_id: self.answer_key_id, title: 'math')
    #   elsif (135..174).include?(r[0].to_i)
    #     response.question = r[0].to_i + 1 - 135
    #     response.section = Section.find_by(answer_key_id: self.answer_key_id, title: 'reading')
    #   elsif (175..214).include?(r[0].to_i)
    #     response.question = r[0].to_i + 1 - 175
    #     response.section = Section.find_by(answer_key_id: self.answer_key_id, title: 'science')
    #   end
    #   self.responses << response
    #   response.save




end
