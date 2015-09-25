enable :sessions

#Home Page
get '/' do
  erb :'index'
end


# Login
get '/login' do
  erb :'users/login'
end

post '/login' do
  @user = User.find_by(name: params[:name])
  if @user == nil || @user.password != params[:password]
    @form_error = "Invalid email or password."
    redirect '/users/login'
  else
    auth_login(@user)
    redirect "/users/#{@user.id}"
  end
end

# Logout

get '/logout' do
  auth_logout
  redirect '/'
end

# Registration(New User)

post '/users' do
  @user = User.new(params)
  if @user.save
    session[:user_id] = @user.id
    auth_login(@user)
    redirect "/users/#{@user.id}"
  else
    redirect '/users/new'
  end
end

#DONE********************************
get '/users/new' do
  erb :'users/new'
end

## Display one user

get '/users/:user_id' do
  @user_id = params[:user_id]
  @user = User.find(@user_id)
  erb :'users/profile'
end

## Update/edit one user

get '/users/:user_id/edit' do
  @user = auth_current_user
  erb :'users/edit'
end

put '/users/:user_id' do
  @user = auth_current_user
  @user.update(name:params[:name], email:params[:email], password:params[:password])
  redirect "/users/#{@user.id}"
end

## Delete one user

delete '/users/:user_id' do
  @user_id = params[:user_id]
  @user = User.find(@user_id)
  @user.destroy
  redirect "/login"
end
