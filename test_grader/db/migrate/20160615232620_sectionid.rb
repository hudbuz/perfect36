class Sectionid < ActiveRecord::Migration
  def change
    remove_column :answers, :section
    add_column :answers, :section_id, :integer
  end
end
