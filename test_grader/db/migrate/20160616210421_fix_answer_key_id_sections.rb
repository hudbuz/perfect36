class FixAnswerKeyIdSections < ActiveRecord::Migration
  def change
    remove_column :sections, :answer_key_id
    add_column :sections, :answer_key_id, :integer
    add_column :responses, :answer_key_id, :integer
  end
end
