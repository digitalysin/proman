class TasksController < ApplicationController
  def show
    @project = Project.find params[:project_id]
    @milestone = Milestone.find params[:milestone_id]
    @task = Task.find params[:id]
  end
  
  def new
    @project = Project.find params[:project_id]
    @milestone = Milestone.find params[:milestone_id]
    @task = @milestone.tasks.build
  end
  
  def create
    @project = Project.find params[:project_id]
    @milestone = Milestone.find params[:milestone_id]
    @task = @milestone.tasks.build params[:task]
    respond_to do |format|
      if @task.save
        Activity.append "#{class_link_to current_member.full_name, user_path(current_member)} created new '#{class_link_to @task.name.humanize, project_milestone_task_path(@project,@milestone,@task)}' task within '#{class_link_to @milestone.name.humanize, project_milestone_path(@project, @milestone)}' milestone and assigned to #{@task.users.collect{|user| class_link_to user.full_name, user_path(user)}.join(',')}"
        format.html { redirect_to project_milestone_path(@project,@milestone), :notice => "Task successfully created." }
      else
        format.html { render :action => :new }
      end
    end
  end
end
