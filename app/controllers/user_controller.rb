
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
  @user = User.create(params)
  if @user.valid?
    session[:id]= @user.id
    redirect '/my_profile'
  else 
    erb :login
  end
end

get '/my_profile' do
  if current_user
    erb :profile
  else
    redirect '/'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/:user_id/create_deck' do
erb :create_deck
end

post '/:user_id/create_deck' do
  @creator_id = params[:user_id]
  @new_deck = Deck.create(:name => params[:deck_name], 
                          :topic => params[:topic], 
                          :creator_id => @creator_id)
  {:deck_id => @new_deck.id, 
   :user_id => params[:user_id], 
   :deck_name => @new_deck.name}.to_json

end

post '/:user_id/:deck_id/create_card' do
  @new_deck = Deck.find(params[:deck_id])
  Card.create(:question => params[:question], 
              :answer => params[:answer], 
              :deck_id => params[:deck_id])

  {:deck_id => @new_deck.id,
   :user_id => params[:user_id]}.to_json

end
