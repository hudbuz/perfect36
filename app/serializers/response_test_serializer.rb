class ResponseTestSerializer < ActiveModel::Serializer
  attributes :id, :question, :answer_choice, :section, :score
  has_one :test
  has_one :response
end
