class ResponseSerializer < ActiveModel::Serializer
  attributes :id, :question, :answer_choice, :section, :score
  has_one :test, serializer: ResponseTestSerializer
end
