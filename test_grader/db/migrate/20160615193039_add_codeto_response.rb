class AddCodetoResponse < ActiveRecord::Migration
  def change
    add_column :answers, :code, :string
    add_column :responses, :code, :string
  end
end
