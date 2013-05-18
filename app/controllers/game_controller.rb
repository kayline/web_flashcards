get '/game' do
  erb :new_game
end

get '/game/:deck_id' do
  @deck = Deck.find(params[:deck_id])
  erb :play
end
