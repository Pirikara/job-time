class TimecardSerializer < ActiveModel::Serializer
  attributes :id, :year, :month, :day, :in_at, :out_at, :user_id, :username

  def username
    object.user.name
  endå
end