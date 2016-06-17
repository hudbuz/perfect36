class ChangeSectionAnswers < ActiveRecord::Migration
  def change
    remove_column :responses, :section
    add_column :responses, :section_id, :integer
  end
end
