class ResponseTestSerializer < ActiveModel::Serializer
  attributes :id, :question, :answer_choice, :section
  has_one :test
  has_one :response
end
