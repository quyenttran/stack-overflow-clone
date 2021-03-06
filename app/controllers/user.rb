before do
  if logged_in?
    @user = User.find(session[:id])
  end
end

get '/' do
  @users = User.all
  @questions = Question.all
  erb :'index'
end

get "/users/new" do
  if logged_in?
    redirect "/users/#{@user.id}/profile"
  end
  @user = User.new
  erb :'users/new'
end

post "/users" do
  @user = User.new(params[:user])
  if @user.save
    session[:id] = @user.id
    redirect '/'
  else
    @errors = ["You cant leave fields blank!"]
    erb :'users/new'
  end
end

get '/users/logout' do
  session.delete(:id)
  redirect '/'
end

get '/users/login' do
  erb :'users/login'
end

post '/users/login' do
  @user = User.find_by(email: params[:user][:email])
  if @user && @user.authenticate(params[:user][:password])
    session[:id] = @user.id
    redirect :"/users/#{@user.id}/profile"
  else
    @errors = "Username and password did not match"
    erb :'users/login'
  end
end

get '/users/:id/profile' do
	@user = User.find(params[:id])
  if session[:id] != params[:id].to_i
    erb :'users/login'
  else
    erb :'users/profile'
  end
end
