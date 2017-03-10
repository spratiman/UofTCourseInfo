class AddIndexToRating < ActiveRecord::Migration[5.0]
  def change
    add_index :ratings, [:user_id, :course_id, :rating_type], unique: true
  end
end
