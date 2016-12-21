class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :student_id
      t.integer :test_id
      t.string :answer_choice
      t.string :section
      t.integer :question

      t.timestamps null: false
    end
  end
end
