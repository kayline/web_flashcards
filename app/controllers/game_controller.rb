get '/game' do
  erb :new_game
end


post '/game/:deck_id/:round_id' do
  @deck = Deck.find(params[:deck_id])
  @next_card = Card.find(params[:next_card_id])
  @answer = Card.find(params[:current_card_id]).answer
  @round = Round.find(params[:round_id])
  if params[:guess] == @answer
    @round.correct += 1
  else
    @round.incorrect += 1
  end
  redirect "/game/#{@deck.id}/#{@round.id}/#{@next_card.id}"  
end

get '/game/:deck_id/:round_id/:card_id' do
  @deck = Deck.find(params[:deck_id])
  @card = Card.find(params[:card_id])
  @round = Round.find(params[:round_id])
  erb :play

end

get '/game/start_round/:deck_id' do
  @deck = Deck.find(params[:deck_id])
  @card = @deck.cards.first
  @round = Round.create(:deck_id => @deck.id, :user_id => session[:user_id])

  
  erb :play
end
