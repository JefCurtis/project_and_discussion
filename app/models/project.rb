class Project < ActiveRecord::Base
	has_many :discussions, dependent: :destroy
  has_many :tasks

  validates :title, presence: true, uniqueness: true, length: { minimum: 10 }
	validates :body, presence: true 
	validates :like_count, numericality: true , allow_nil: true

  scope :ten, -> {limit(10)}
  scope :top_three, -> { limit(3) }
  scope :all_but, lambda {|ids| where(["id NOT IN (?)", ids] )}
  scope :by_hit_count, -> { order("hit_count DESC") }
  scope :by_like_count, -> { order("like_count DESC") }
  scope :recent, lambda { |x| order("updated_at DESC").limit(x) }
  scope :limited, lambda { |x| limit(x) }

  before_save :capitalize_title, :capitalize_body
  after_save :save_message
  # before_save :capitalize_title, only: :create

  #default_scope { order("updated_at DESC") }
  
  private

  def capitalize_title
    self.title.capitalize!
  end

  def capitalize_body
    self.body.capitalize!
  end

  def save_message
    Rails.logger.info ">>>>>>>>>>>>>>>>>>>>>>"
    Rails.logger.info "Saved project."
    Rails.logger.info ">>>>>>>>>>>>>>>>>>>>>>"
  end

end
