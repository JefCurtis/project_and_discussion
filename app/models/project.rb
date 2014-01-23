class Project < ActiveRecord::Base
	validates :title, presence: true, uniqueness: true, length: { minimum: 10 }
	validates :body, presence: true 
	validates :like_count, numericality: true , allow_nil: true

  scope :ten, -> {limit(10)}
  scope :top_three, -> { limit(3) }
  scope :recent, -> { where(["updated_at > ?", Time.now - 10.day]) } 
  scope :all_but, lambda {|ids| where(["id NOT IN (?)", ids] )}
  scope :by_hit_count, -> { order("hit_count DESC") }
  scope :by_like_count, -> { order("like_count DESC") }
  scope :recent, lambda { |x| order("updated_at DESC").limit(x) }

  #default_scope { order("updated_at DESC") }

end
