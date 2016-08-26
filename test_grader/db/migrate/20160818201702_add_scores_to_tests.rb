class AddScoresToTests < ActiveRecord::Migration
  def change

    add_column :tests, :english_score, :integer
    add_column :tests, :math_score, :integer
    add_column :tests, :reading_score, :integer
    add_column :tests, :science_score, :integer
    add_column :tests, :total_score, :integer
  end
end
