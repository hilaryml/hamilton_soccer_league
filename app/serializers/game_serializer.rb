class GameSerializer < ActiveModel::Serializer
  attributes :id, :location, :date, :time
  has_many :teams, serializer: TeamGameSerializer
  has_many :comments, serializer: GameCommentSerializer
end
