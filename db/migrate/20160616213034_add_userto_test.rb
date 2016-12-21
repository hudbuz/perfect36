class AddUsertoTest < ActiveRecord::Migration
  def change
    add_column :tests, :user_id, :integer
    remove_column :responses, :student_id
    add_column :responses, :user_id, :integer
  end
end
