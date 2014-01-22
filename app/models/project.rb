class Project < ActiveRecord::Base
	validates :title, presence: true, uniqueness: true, length: { minimum: 10 }
	validates :body, presence: true 
	validates :like_count, numericality: true , allow_nil: true
end
