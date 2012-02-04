class CommentsController < ApplicationController
  def create
    @comment = Comment.new params[:comment]
    respond_to do |format|
      if @comment.save
        format.html { respond_and_redirect("Comment succesfully created.") }
      else
        format.html { respond_and_redirect("Comment failed.") }
      end
    end
  end
  
  private
    def respond_and_redirect(notice)
      task = Task.find params[:task_id] if params[:task_id].present?
      milestone = Milestone.find(params[:milestone_id]) if params[:milestone_id].present? 
      project = Project.find(params[:project_id]) if params[:project_id].present?

      if task.present?
        Activity.append "#{class_link_to current_member.full_name, user_path(current_member)} commenting #{class_link_to task.name, project_milestone_task_path(project, milestone, task)} task"
        redirect_to project_milestone_task_path(project, milestone, task), :notice => notice
      elsif milestone.present?
        Activity.append "#{class_link_to current_member.full_name, user_path(current_member)} commenting #{class_link_to milestone.name, project_milestone_path(project, milestone)} milestone"
        redirect_to project_milestone_path(project, milestone), :notice => notice
      elsif project.present?
        Activity.append "#{class_link_to current_member.full_name, user_path(current_member)} commenting #{class_link_to project.name, project_path(project)} project"
        redirect_to project_path(project), :notice => notice
      end
    end
end
