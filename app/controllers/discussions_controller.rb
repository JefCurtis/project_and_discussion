class DiscussionsController < ApplicationController
		before_action :set_discussion, only: [:show, :edit, :update, :destroy ]

	layout "discussion"

	def index
		@discussions = Discussion.all
	end

	def show

	end

	def create
		@discussion = Discussion.new(discussion_params)
		if @discussion.save
			redirect_to discussions_path
		else
			render :new
		end
	end

	def destroy
		@discussion.destroy
		redirect_to discussions_path
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
		@discussion = Discussion.find(params[:id])
	end

	def discussion_params
    params.require(:discussion).permit(:title, :description)
  end


end
