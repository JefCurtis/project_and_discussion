class Comment < ActiveRecord::Base
  belongs_to :discussion
  validates_length_of :body, minimum: 10, message: ", the title must be at least 10 characters"
  validates :body, presence: true, uniqueness: true

end
