class TestUserSerializer < ActiveModel::Serializer
  attributes :id, :english_score, :reading_score, :math_score, :science_score, :total_score, :answer_key_id, :created_at
  has_one :test
  has_one :user
end
