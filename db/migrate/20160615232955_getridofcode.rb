class Getridofcode < ActiveRecord::Migration
  def change
    remove_column :answers, :code
    add_column :answers, :correct_answer, :string
  end
end
