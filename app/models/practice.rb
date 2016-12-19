class Practice < ActiveRecord::Base
  has_many :practice_users
  has_many :players, through: :practice_users
end
