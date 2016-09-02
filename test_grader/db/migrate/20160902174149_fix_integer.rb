class FixInteger < ActiveRecord::Migration
  def change
    change_column :users, :uid, :integer, :limit => 20
  end
end
