class UserTestSerializer < ActiveModel::Serializer
  attributes :id
  has_one :test
  has_one :user
end
