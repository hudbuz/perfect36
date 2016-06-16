class Test < ActiveRecord::Base
  belongs_to :answer_key
  has_many :sections
  has_many :answers, :through => :sections
  has_many :responses
  has_many :users, :through => :responses
 
  accepts_nested_attributes_for :responses

  def self.format
    format = {:english => 75, :math => 60, :reading => 40, :science => 40}


  end
end
