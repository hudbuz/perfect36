class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :code
      t.string :status

      t.timestamps null: false
    end
  end
end
