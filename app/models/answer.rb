class Answer < ActiveRecord::Base
  validates :answer, :user_id, :question_id, presence: true

  belongs_to :question
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
end
