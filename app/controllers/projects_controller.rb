class ProjectsController < ApplicationController
	before_action :check_for_id?, only: [:create]
	before_action :set_project, only: [:show, :edit, :update, :destroy, :like, :print_id]
	before_action :print_id, except: [:index, :new, :create ]

	def index
		@projects = Project.order(hit_count: :desc)
		@newest_projects = Project.limit(3).order(created_at: :desc)
	end

#Stretch: simulate user login by creating user controller that has login / logout custom actions.
# Add a callback to projects controller that redirect to listing if they try to create and they are not logged in

	def create
		@project = Project.new(project_params)
		if @project.save
			redirect_to projects_path
		else 
			render :new
		end
	end

	def new
		@project = Project.new
	end

	def show
		@project.hit_count += 1
		@project.save
	end

	def update
		if @project.update(project_params)
			redirect_to @project
		else
			render :new
		end
	end

	def edit

	end

	def like
		session[:project_id] ||= []
		if session[:project_id].include? params[:id].to_i
			redirect_to @project, alert: "Liked already"
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

	def newest_projects
		@newest_projects = Project.order(created_at: :desc)
		#redirect_to projects_path
	end

	def favorites
		redirect_to projects_path
	end

	def print_id
		Rails.logger.info "......................................."
		Rails.logger.info  "This is the id passed #{@project.id}"
		Rails.logger.info "......................................."
	end

	private

	def check_for_id?
	if session[:is_logged_in]
		session[:is_logged_in] = false
		true
	else
		session[:is_logged_in] = true
		redirect_to projects_path, alert: "You must be logged in to create a project."
	end
	
	end

  def project_params
    params.require(:project).permit(:title, :body)
  end

  def set_project
		@project = Project.find(params[:id])
	end

end
