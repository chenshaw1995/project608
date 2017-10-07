module ApplicationHelper
    def thelikes(user)
        logged_in?
    session[:thelikes] = Like.find_by(user_id:current_user)
    end
    
end
