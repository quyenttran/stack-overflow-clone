class Question < ActiveRecord::Base
  validates :title, :question, :user_id, { presence: true }

  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  def self.time_format(datetime)
    "#{datetime.strftime('%h')} #{datetime.strftime('%d')} '#{datetime.strftime('%y')} at #{datetime.strftime('%R')}"
  end

  def vote_sum
    self.votes.inject(0) { |total, vote| total + vote.value}
  end

end
