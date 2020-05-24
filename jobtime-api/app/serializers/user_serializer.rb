class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :admin
  has_many :timecards
end
