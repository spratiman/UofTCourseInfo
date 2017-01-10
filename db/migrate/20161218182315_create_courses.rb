class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :code
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
