class CreateMoodFieldInEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :sentiments, :mood, :string
  end
end
