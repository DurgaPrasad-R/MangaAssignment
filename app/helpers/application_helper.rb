module ApplicationHelper
    def display_username(user)
      user.present? && user.username.present? ? user.username : 'Anonymous'
    end
  
    def display_user_info(user)
      user.present? ? user : 'Unknown User'
    end
  end
  