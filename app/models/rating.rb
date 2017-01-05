class Rating < ApplicationRecord
  belongs_to :course #-> course that is rated
  belongs_to :user #-> user giving rating
  validates :value, :inclusion => {:in => 1..5}, presence: true
  validates :course_id, presence: true
  validates :user_id, presence: true
end
