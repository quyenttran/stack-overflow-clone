get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:id] = @user.id
    redirect "/users/#{@user.id}/profile"
  else
    @errors = @user.errors.full_messages
    puts @errors
    erb :'users/new'
  end
end
