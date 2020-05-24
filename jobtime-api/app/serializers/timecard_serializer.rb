class TimecardSerializer < ActiveModel::Serializer
  attributes :id, :in_at, :out_at, :breaktime, :working_hours, :user_id, :username

  def username
    object.user.name
  end
end