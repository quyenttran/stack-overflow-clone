class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.string :question, null: false
      t.integer :user_id, null:false
      t.integer :view_count, default: 0
      # questions.votes.count
      # t.integer :vote_count, default: 0

      t.timestamps(null:false)
    end
  end
end
