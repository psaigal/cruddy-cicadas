get '/' do
  erb :index
end


get '/login' do
  erb :login
end

post '/sessions/create' do
  # params
  user = User.find_by_email(params[:email])

  # what if i entered the wrong email? XXX
  # what if i entered the wrong password but the right email? XXX
    # step 1: how to check correct password?

  if user.nil?
    redirect '/login'
  elsif user.password == params[:password]
    redirect "/users/#{user.id}"
  else
    redirect '/login'
  end
  
end

get '/users/new' do
  erb :signup
end

post '/users/create' do
  user = User.new(params)
  if user.save
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    redirect "/users/new"
  end
end

# /users/1 == first user
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


get '/logout' do
  session[:user_id] = nil
  redirect '/'
end


















