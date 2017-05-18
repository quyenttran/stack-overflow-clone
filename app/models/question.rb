class Question < ApplicationRecord
  # Remember to create a migration!
  belongs_to :questioner, class_name: :User
  has_many :answers

end
