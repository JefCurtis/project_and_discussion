class UsersController < ApplicationController

  def login
    session[:is_logged_in] = true
    redirect_to projects_path, notice: "You are logged in."
  end

  def logout
    session[:is_logged_in] = false
    redirect_to root_path, notice: "You are logged out."
  end
  

end
