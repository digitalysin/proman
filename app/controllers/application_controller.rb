class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :before_filter_callback
  
  private
    def after_sign_up_path
      root_path
    end
    
    def after_sign_in_path
      root_path
    end
    
    def before_filter_callback
      authenticate_member!    
      @current_active_user = User.find current_member.id if current_member.present?  
      @today_activity = Activity.today
      @yesterday_activity = Activity.yesterday
      @all_projects = Project.all
    end
end
