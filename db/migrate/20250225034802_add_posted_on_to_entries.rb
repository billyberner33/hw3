class AddPostedOnToEntries < ActiveRecord::Migration[7.1]
  def change
    add_column :entries, :posted_on, :date
  end
end
