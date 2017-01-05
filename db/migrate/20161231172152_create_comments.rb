class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :body, null: false, default: ""
      t.references :user, foreign_key: true
      t.references :course, foreign_key: true

      t.timestamps
    end
    add_index :comments, [:user_id, :course_id], unique: true
  end
end
