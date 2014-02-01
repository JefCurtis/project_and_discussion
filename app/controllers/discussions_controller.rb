class DiscussionsController < ApplicationController
		before_filter :authenticate_user!, except: [:show, :index, :all]
		before_action :set_project 
		before_action :set_discussion, only: [:destroy, :edit, :update, :show]
		before_action :set_comments, only: [:show]

	def index
		@discussions = @project.discussions.all
	end

	def show
		
	end

	def edit

	end

	def create
		@discussion = Discussion.new(discussion_params)
		@discussion.project = @project
		if @discussion.save
			redirect_to project_discussions_path(@project), notice: "Thanks for adding!."
		else
			flash.now[:alert] = "There was an error when try to add to the discussion."
			render :edit
		end
	end

	def destroy
		if @discussion.destroy
			redirect_to project_discussions_path(@project, @discussion), notice: "Comment was deleted successfully."
		else
			redirect_to project_discussions_path(@project, @discussion), alert: "The answer could not be deleted."
		end
	end

	def new
		@discussion = Discussion.new
	end

	def update
		if @discussion.update(discussion_params)
			redirect_to project_discussions_path(@project, @discussion)
		else
			render :edit
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
    params.require(:discussion).permit(:description)
  end

  def set_comments
  	@comments = @discussion.comments.find(params[:comment_id])
  end



end
