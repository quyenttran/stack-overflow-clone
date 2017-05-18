enable :sessions

get '/users/login' do
  @user = User.new
  erb :'users/form'
end

post '/users/login' do
  @user = User.find_by(username: params[:user][:username])
  redirect "/users/#{@user.id}"
end

get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb :'users/form'
end

put '/users/:id' do
  @user = User.find(params[:id])
  @user.assign_attributes(params[:user])
  @user.password=(params[:user][:password])
  @user.save
  redirect "/users/#{@user.id}"
end

get '/users/logout' do
  session.clear
  redirect '/'
end
