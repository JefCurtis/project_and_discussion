class Discussion < ActiveRecord::Base
  belongs_to :project
  has_many :comments, dependent: :destroy
	validates_length_of :description, minimum: 10, message: ", the title must be at least 10 characters"
	validates :description, presence: true


  scope :limited, lambda { |x| limit(x) }


end
