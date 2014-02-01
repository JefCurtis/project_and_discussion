class CommentsController < ApplicationController
    before_filter :authenticate_user!, except: [:show, :index, :all]
    before_action :set_discussion
    before_action :set_comment, only: [:edit, :update, :destroy ] 

  def create
    @comment = @discussion.comments.new(comment_params)
    if @comment.save
      redirect_to project_discussions_path(@discussion.project), notice: "Thanks for the comment."
    else
      flash.now[:alert] = "Your comment couldn't be saved. Try agin."
      @project = @discussion.project
      render "/projects/show"
    end
  end  

  def destroy
    if @comment.destroy
      redirect_to discussion.project, notice: "Your comment has been deleted"
    else
      redirect_to discussion.project, alert: "Your comment couldn't be deleted."
    end
  end

  def update
    @comment.update_attributes(comment_params)
  end

  def edit

  end

  def new
    @comment = Comment.new
  end

private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_discussion
    @discussion = Discussion.find(params[:discussion_id])
  end

  def set_comment
    @comment = @discussion.comments.find(params[:id])
  end



end
