class Question < ActiveRecord::Base
  validates :title, :question, :user_id, { presence: true }

  belongs_to :user
  has_many :answers
  # has_many :votes

  def self.time_format(datetime)
    "#{datetime.strftime('%h')} #{datetime.strftime('%d')} '#{datetime.strftime('%y')} at #{datetime.strftime('%R')}"
  end

end
