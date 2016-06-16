class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :title
      t.integer :question_count
      t.integer :test_id
      t.string :answer_key_id

      t.timestamps null: false
    end
  end
end
