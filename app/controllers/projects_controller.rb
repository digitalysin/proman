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
