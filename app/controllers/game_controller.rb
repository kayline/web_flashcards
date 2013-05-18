get '/game' do
  erb :new_game
end


post '/game/:deck_id' do
  @deck = Deck.find(params[:deck_id])
  @next_card = Card.find(params[:next_card_id])

  redirect "/game/#{@deck.id}/#{@next_card.id}"
end

get '/game/:deck_id/:card_id' do
  @deck = Deck.find(params[:deck_id])
  @card = Card.find(params[:card_id])

  
  erb :play
end
