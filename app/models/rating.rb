class Rating < ApplicationRecord
  belongs_to :course #-> course that is rated
  belongs_to :user #-> user giving rating
  validates :value, :inclusion => 1..5, presence: true, numericality: :integer
  validates :course_id, presence: true
  validates :user_id, presence: true
  validates :rating_type, :inclusion => ['Overall', 'Difficulty', 'Usefulness',
                                        'Course Load'],
                          presence: true
  attr_readonly [:course_id, :user_id]


  RATING_TYPES = (rating_type_overall,
                  rating_type_usefulness,
                  rating_type_courseload,
                  rating_type_difficulty =
                  'Overall', 'Usefulness', 'Course Load', 'Difficulty')
  
  scope :overall,     ->  { where(rating_type: rating_type_overall) }
  scope :usefulness,  ->  { where(rating_type: rating_type_usefulness) }
  scope :courseload,  ->  { where(rating_type: rating_type_courseload) }
  scope :difficulty,  ->  { where(rating_type: rating_type_difficulty) }

  def overall?;     rating_type == rating_type_overall    end
  def usefulness?;  rating_type == rating_type_usefulness end
  def courseload?;  rating_type == rating_type_courseload end
  def difficulty?;  rating_type == rating_type_difficulty end
end
