class Removequestioncount < ActiveRecord::Migration
  def change
    remove_column :sections, :question_count
    
  end
end
