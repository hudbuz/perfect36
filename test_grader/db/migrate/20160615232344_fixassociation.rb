class Fixassociation < ActiveRecord::Migration
  def change
    remove_column :answers, :test_id
    add_column :answers, :answer_key_id, :integer
  end
end
