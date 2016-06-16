class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :test_id
      t.string :section
      t.integer :question

      t.timestamps null: false
    end
  end
end
