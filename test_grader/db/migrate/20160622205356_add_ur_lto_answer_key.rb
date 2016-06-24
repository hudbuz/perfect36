class AddUrLtoAnswerKey < ActiveRecord::Migration
  def change
    add_column :answer_keys, :url, :string
  end
end
