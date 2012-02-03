class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :before_filter_callback
  helper_method :class_link_to
  
  private
    def after_sign_up_path
      root_path
    end
    
    def after_sign_in_path
      root_path
    end
    
    def before_filter_callback
      authenticate_member!    
      if current_member.present?  
        @current_active_user = User.find current_member.id 
        @today_activity = Activity.today
        @yesterday_activity = Activity.yesterday
        @all_projects = Project.all
      end
    end
    
    def class_link_to(title,path)
      self.class.helpers.link_to title, path
    end
end
