class UserCourseRelation < ApplicationRecord
  #Relations
  belongs_to :user
  belongs_to :course

end
