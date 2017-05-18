class Answer < ApplicationRecord
  # Remember to create a migration!
  belongs_to :answerer, class_name: :User
  belongs_to :question

end
