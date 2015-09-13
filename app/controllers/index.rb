# this is like, sooooooo my app
get '/' do
  erb :index
end

# renders and form, allowing an existing user to
# login
get '/login' do
  erb :login
end

# creates session for 'valid' user
post '/sessions/create' do
  user = User.find_by_email(params[:email])

  # what if i entered the wrong email? XXX
  # what if i entered the wrong password but the right email? XXX
    # step 1: how to check correct password?

  if user.nil?
    redirect '/login'
  elsif user.password == params[:password]
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    redirect '/login'
  end

end

# renders a new form for user creation
get '/users/new' do
  erb :signup
end

# actually creates a user
post '/users/create' do
  user = User.new(params)
  if user.save
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    redirect "/users/new"
  end
end

# profile page for specific user
get '/users/:id' do
  @user = User.find_by_id(params[:id])
  erb :profile
end

# - matches below get logout
# - yes, we would need a form
# post '/logout' do
#   session[:user_id] = nil
#   redirect '/'
# end

# logout
get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

# render a form for a user to edit their info
get '/users/:id/edit' do
  @user = User.find_by_id(params[:id])
  
  # how to confirm this is actually the user?
  # if session[:user_id] == @user.id
  if current_user == @user
    erb :edit_user
  else
    redirect "/users/#{session[:user_id]}"
  end
end

# the "actual" changing of our information
post '/users/:id/update' do
  user = User.find_by_id(params[:id])
  user.name = params[:name] # new name
  user.save
  redirect "/users/#{user.id}"
end

# to delete (as "homework")
# - find user by id
# - destroy that user (user.destroy)
# - redirect to index page

# render a new form for a task, for a user
get '/users/:id/tasks/new' do
  @user = User.find_by_id(params[:id])
  erb :new_task
end

post '/users/:id/tasks/create' do
  user = User.find_by_id(params[:id])
  task = Task.new(
    description: params[:description],
    due_date: params[:due_date],
    user_id: params[:user_id]
    )
  if task.save
    redirect "/users/#{user.id}/tasks"
  else
    redirect "/users/#{user.id}/tasks/new"
  end
end

get '/users/:id/tasks' do
  @user = User.find_by_id(params[:id])
  erb :tasks
end





















