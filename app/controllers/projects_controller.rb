class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end
  
  def show
    @project = Project.find params[:id]
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new params[:project]
    respond_to do |format|
      if @project.save 
        Activity.append "#{class_link_to current_member.full_name, user_path(current_member)} created new '#{class_link_to @project.name, project_path(@project)}' project and assigned to #{@project.users.collect{ |u| class_link_to u.full_name, user_path(u) }.join(',')}"
        format.html { redirect_to projects_path, :notice => "Project successfully created." }
      else
        format.html { render :action => :new }
      end
    end
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
end
