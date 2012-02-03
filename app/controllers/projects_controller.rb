class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end
  
  def show
    
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new params[:project]
    respond_to do |format|
      if @project.save 
        Activity.append "#{self.class.helpers.link_to current_member.full_name, user_path(current_member)} created new #{@project.name} project and assigned to #{@project.users.collect{ |u| self.class.helpers.link_to u.full_name, user_path(u) }.join(',')}"
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
