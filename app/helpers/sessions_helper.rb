helpers do
  def current_user
    @current_user = User.find_by_id(session[:user_id])
  end

  def admin?
    # some code to determin if an admin user is logged in
  end
end