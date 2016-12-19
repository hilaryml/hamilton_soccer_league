class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:player, :coach]

  has_many :game_users
  has_many :games, through: :game_users
  has_many :practice_users
  has_many :practices, through: :practice_users
  belongs_to :team

end
