class Answer < ActiveRecord::Base
  
  belongs_to :section
  belongs_to :answer_key
end
