class AddRatingTypeToRatings < ActiveRecord::Migration[5.0]
  def change
    add_column :ratings, :rating_type, :string
  end
end
