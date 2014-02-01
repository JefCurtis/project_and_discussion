class ProjectsController < ApplicationController
	before_filter :authenticate_user!, except: [:show, :index, :all]
	before_action :set_project, only: [:show, :edit, :update, :destroy, :like, :print_id ]

	def index
		@newest_projects = Project.all.recent(3)
		@popular_projects = Project.all.by_hit_count.limited(3)
	end

	def create
		@project = Project.new(project_params)
		if @project.save
			redirect_to projects_path
		else 
			render :new
		end
	else
		redirect_to projects_path
	end
	

	def new
		@project = Project.new
	end

	def show
		@project.hit_count += 1
	end

	def update
		if @project.update_attributes(project_params)
			redirect_to @project
		else
			render :new
		end
	end

	def edit

	end

	def top_projects
		@projects = Project.all.by_hit_count.limited(3)
	end

	def like
		session[:project_id] ||= []
		if session[:project_id].include? params[:id].to_i
			redirect_to project_url, alert: "Liked already"
		else
			session[:project_id] << @project.id
			@project.like_count += 1
			@project.save
			redirect_to @project, notice: "Thanks for liking the project!"
		end
	end

	def destroy
		@project.destroy
		redirect_to projects_path, notice: "Your project has been deleted."
	end

	def all
		@all_projects = Project.all
	end

	private
	
  def project_params
    params.require(:project).permit(:title, :body)
  end

  def set_project
		@project = Project.find(params[:id])
	end

end
