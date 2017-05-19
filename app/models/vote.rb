class Vote < ActiveRecord::Base
  # Remember to create a migration!*
  belongs_to :votable, polymorphic: true
  belongs_to :voter, class_name: :User

  validates :voter_id, :uniqueness => { :scope => [:votable_id, :votable_type] }
end
