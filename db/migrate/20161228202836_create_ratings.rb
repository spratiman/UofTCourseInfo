class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.references :user
      t.references :course
      t.integer :value

      t.timestamps
    end
    add_index :ratings, [:user_id, :course_id], unique: true
  end
end
