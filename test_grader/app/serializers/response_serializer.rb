class ResponseSerializer < ActiveModel::Serializer
  attributes :id, :question, :answer_choice, :section
  has_one :test, serializer: ResponseTestSerializer
end
