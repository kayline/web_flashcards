
get '/login' do
  erb :login
end

post '/login' do
  @user = User.authenticate(params[:email], params[:password])
  if @user 
    session[:id]= @user.id
    @user
    redirect '/my_profile'
  else 
    erb :login
  end
end

get '/create_account' do
  erb :signup
end

post '/create_account' do
  @user = User.new(params)
  if @user.save
    session[:id]= @user.id
    @user
    redirect '/my_profile'

  else 
    erb :login
  end
end

get '/my_profile' do
   erb :profile
end

get '/logout' do
  session.clear

  erb :index
end
