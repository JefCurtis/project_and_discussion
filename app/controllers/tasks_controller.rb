class TasksController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_task, only: [:show, :edit, :destroy, :update]
  before_action :set_project, except: [:index]

  def index
    @user = current_user
    @tasks = @user.tasks.all
  end

  def create
    @task = Task.new(task_params)
    @task.project = @project
    if @task.save
      redirect_to project_tasks_path(@project), notice: "Your task has been added."
    else
      render :new
    end
  end

  def update
    if @task.update_attributes(task_params)
      redirect_to @project, notice: "your task has been changed."
    else
      redirect_to @project, alert: "Your task couldn't be changed."
    end
  end

  def destroy
  end

  def new
    @task = Task.new
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def task_params
    params.require(:task).permit(:name, :due_date, :is_completed)
  end

end
