class TasksController < ApplicationController
  before_filter :authenticate_user!, except: [:destroy, :update, :edit]
  before_action :set_task, only: [:show, :edit, :destroy, :update]
  before_action :set_project, except: [:index]

  def index
    @tasks = current_user.tasks
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
      redirect_to :back
    else
      redirect_to params[:redirect_to], alert: "Your task couldn't be changed."
    end
  end

  def edit
  end

  def destroy
    if @task.destroy
      redirect_to project_tasks_path, notice: "Your task has been deleted."
    end
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
    params.require(:task).permit(:name, :due_date, :is_completed, {user_ids: []})
  end

end
