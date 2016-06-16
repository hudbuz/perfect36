class CreateAnswerKeys < ActiveRecord::Migration
  def change
    create_table :answer_keys do |t|
      t.string :code

      t.timestamps null: false
    end

    add_column :tests, :answer_key_id, :integer
  end
end
