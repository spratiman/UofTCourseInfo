class Comment < ApplicationRecord
  belongs_to :user #-> user putting the comment
  belongs_to :course #-> course that is commented 
end
