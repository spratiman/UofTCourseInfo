class Comment < ApplicationRecord
  belongs_to :user #-> user putting the comment
  belongs_to :course #-> course that is commented
  attr_readonly [:user_id, :course_id]
  default_scope { order(updated_at: :desc) }
  has_ancestry
end
