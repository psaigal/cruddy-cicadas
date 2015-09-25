def auth_current_user
  return nil unless session[:user_id]
  @current_user ||= User.find(session[:user_id])
end

def auth_login(user)
  session[:user_id] = user.id
  auth_current_user
end

def auth_logout
  session[:user_id] = nil
end

def logged_in?
  !session[:user_id].nil?
end

def same_user?
  session[:user_id] == @question.author.id
end
