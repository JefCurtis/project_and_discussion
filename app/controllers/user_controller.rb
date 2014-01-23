class UserController < ApplicationController 

#Stretch: simulate user login by creating user controller that has login / logout custom actions.
# Add a callback to projects controller that redirect to listing if they try to create and they are not logged in

  def login
    session[:is_logged_in] = true
    redirect_to projects_path, notice: "You are logged in."
  end

  def logout
    session[:is_logged_in] = false
    redirect_to root_path, notice: "You are logged out."
  end
  
end
