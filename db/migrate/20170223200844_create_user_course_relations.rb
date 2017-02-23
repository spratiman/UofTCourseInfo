class CreateUserCourseRelations < ActiveRecord::Migration[5.0]
  def change
    create_table :user_course_relations do |t|
      t.belongs_to :user
      t.belongs_to :course
      t.text :body, null: true
      t.boolean :has_dropped, default: false
      t.boolean :is_waitlisted, default: false

      t.timestamps
    end
  end
end
