class AddDetailsToCourse < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :exclusions, :text
    add_column :courses, :prerequisites, :text
    add_column :courses, :breadths, :text
  end
end
