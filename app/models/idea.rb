class Idea < ApplicationRecord
  belongs_to :project
  belongs_to :user

  has_many :votes, dependent: :destroy

  def positive_votes
    votes.where(value: 1).count
  end

  def negative_votes
    votes.where(value: -1).count
  end

  def total_votes
    positive_votes - negative_votes
  end
end
