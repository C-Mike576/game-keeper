module ApplicationHelper

    def require_login
        if !logged_in?
            redirect_to '/login'
        end
    end
    
    def logged_in?
        !!session[:user_id]
    end
    
    def current_user
        @current_user ||= User.find_by_id(session[:user_id])  if  logged_in?
    end
end
