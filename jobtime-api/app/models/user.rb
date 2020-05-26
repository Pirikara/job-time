class User < ApplicationRecord
  # association
  has_many :timecards

  # validation
  validates :email,
            :uid, presence: true

  validates :email,
            :uid, uniqueness: true
end
