class MilestonesController < ApplicationController
  
  def show
    @milestone = Milestone.find params[:id]
    @project = @milestone.project
  end
  
  def new
    @project = Project.find params[:project_id]
    @milestone = @project.milestones.build
  end
  
  def create
    @project = Project.find params[:project_id]
    @milestone = @project.milestones.build params[:milestone]
    respond_to do |format|
      if @milestone.save
        Activity.append "#{class_link_to @current_active_user.full_name, user_path(@current_active_user)} created new milestone '#{class_link_to @milestone.name.humanize, project_milestone_path(@project, @milestone) }' within '#{class_link_to @project.name.humanize, project_path(@project)}' and assigned to #{@milestone.users.collect{|user| class_link_to user.full_name, user_path(user)}.join(',')}"
        format.html { redirect_to project_path(@milestone.project), :notice => "Milestone successfully created." }
      else
        format.html {render :action => :new}
      end
    end
  end
end
