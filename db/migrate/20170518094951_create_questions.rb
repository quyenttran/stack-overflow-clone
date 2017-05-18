class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.text :question, null: false
      t.integer :questioner_id, null: false

      t.timestamps(null: false)
    end
  end
end
