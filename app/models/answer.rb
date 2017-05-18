class Answer < ActiveRecord::Base
  validates :answer, presence: true
  validates :user_id, presence: true
  validates :question_id, presence: true

  # has_one :question
  # belongs_to :user
end
