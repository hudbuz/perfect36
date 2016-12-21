class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :role
  has_many :tests, serializer: TestUserSerializer
end
