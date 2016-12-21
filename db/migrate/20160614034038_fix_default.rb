class FixDefault < ActiveRecord::Migration
  def change
    remove_column :users, :role
    add_column :users, :role, :integer, :default => 0
    remove_column :tests, :status
    add_column :tests, :status, :string, :default => 'incomplete'

    add_column :responses, :score, :integer, :default => 0
  end
end
