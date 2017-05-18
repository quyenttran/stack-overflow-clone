class Answer < ActiveRecord::Base
  validates :answer, :user_id, :question_id, presence: true

  has_one :question
  belongs_to :user
end
