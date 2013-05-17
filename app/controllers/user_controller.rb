
get '/login' do
  erb :login
end

post '/login' do
  @user = User.authenticate(params[:email], params[:password])
  if @user 
    session[:id]= @user.id
    @user
  else 
    erb :login
  end
end

post '/create_account' do
  @user = User.new(params)
  if @user.save
    session[:id]= @user.id
    @user
  else 
    erb :login
  end
end
