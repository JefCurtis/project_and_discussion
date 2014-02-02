class Task < ActiveRecord::Base
  belongs_to :project
  has_many :assignments
  has_many :users, through: :assignments

  scope :only_complete,   -> { where(is_completed: true) }
  scope :only_incomplete, -> { where(is_completed: false)}


end
