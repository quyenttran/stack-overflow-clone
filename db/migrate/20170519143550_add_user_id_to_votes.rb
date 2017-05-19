class AddUserIdToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :voter_id, :integer
  end
end
