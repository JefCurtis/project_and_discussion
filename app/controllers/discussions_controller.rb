class DiscussionsController < ApplicationController
		before_action :set_project 
		before_action :set_discussion, only: [:destroy]
	layout "discussion"

	def index
		@discussions = Discussion.all
	end

	def show
	end

	def create
		@discussion = Discussion.new(discussion_params)
		@discussion.project = @project
		if @discussion.save
			redirect_to @project, notice: "Thanks for the comment."
		else
			flash.now[:alert] = "Your comment couldn't be saved. Try agin."
			render "/projects/show"
		end
	end

	def destroy
		if @discussion.destroy
			redirect_to @project, notice: "Comment was deleted successfully."
		else
			redirect_to @project, alert: "The answer could not be deleted."
		end
	end

	def new
		@discussion = Discussion.new
	end

	def update
		if @discussion.update(discussion_params)
			redirect_to @discussion
		else
			render :new
		end
	end

	def flag
		@project = Discussion.new(discussion_params)
	end

	private

	def set_discussion
		@discussion = @project.discussions.find(params[:id])
	end

  def set_project
  	@project = Project.find(params[:project_id])
  end

	def discussion_params
    params.require(:discussion).permit(:title, :description)
  end



end
