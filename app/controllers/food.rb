#view all foods for a specific users
get '/users/:user_id/foods' do
  @user = User.find(params[:user_id])
  erb :'foods/index', locals: {:user => @user }
end

#form for adding new food for user
get '/users/:user_id/foods/new' do
  @user = User.find(params[:user_id])
  if request.xhr?
    erb :'foods/newfood', layout:false
  else
    erb :'foods/newfood'
  end
end

#add new food
post '/users/:user_id/foods' do
  @user = User.find(params[:user_id])
  @food = Food.find_by(name: params[:name])
  @new_entry = UsersFood.create(user_id: @user.id, food_id: @food.id)
  p "*"*50
  p @food.id
    if request.xhr?
      erb :'foods/_specificfood', { layout: false, locals: {:user => @user, :food => @food}}
    else
      redirect "/users/#{@user.id}/foods"
    end
end

#view one food for a specific user

get '/users/:user_id/foods/:id' do
  @user = User.find(params[:user_id])
  @specific_food = Food.find_by(id: params[:id])
  if request.xhr?
    erb :'foods/onefood', layout:false
  else
    erb :'foods/onefood'
  end
end

#delete specific food for specific user
delete '/users/:user_id/foods/:id' do
  @user = User.find(params[:user_id])
  @specific_food = Food.find_by(id: params[:id])
  @specific_food.destroy
  redirect "/users/#{@user.id}/foods"
end





