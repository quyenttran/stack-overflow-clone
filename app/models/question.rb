class Question < ActiveRecord::Base
  # Remember to create a migration!
  # belongs_to :user
  # has_many :answers
  # has_many :votes
  validates :title, :question, :user_id, { presence: true }

  def self.time_format(datetime)
    "#{datetime.strftime('%h')} #{datetime.strftime('%d')} '#{datetime.strftime('%y')} at #{datetime.strftime('%R')}"
  end



end
