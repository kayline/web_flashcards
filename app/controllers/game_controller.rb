get '/game' do
  erb :new_game
end

get '/game/round_complete' do
  erb :round_complete
end


post '/game/:deck_id/:round_id' do
  @deck = Deck.find(params[:deck_id])

  puts "HERE!!!"
  p params 
  p @remaining_card_ids = params[:remaining_card_ids].split(",")
  if @remaining_card_ids.empty?
    puts "no more cards"
    redirect '/game/round_complete'
  else
    @active_card = Card.find(@remaining_card_ids.pop)
    p @remaining_card_ids = @remaining_card_ids.join(",")
    @answer = Card.find(params[:current_card_id]).answer
    @round = Round.find(params[:round_id])
    if params[:guess] == @answer
      @round.correct += 1
    else
      @round.incorrect += 1
    end
    erb :play
  end
  # redirect "/game/#{@deck.id}/#{@round.id}/#{@active_card.id}"  
end

get '/game/:deck_id/:round_id/:card_id' do
  @deck = Deck.find(params[:deck_id])
  @active_card = Card.find(params[:card_id])
  @round = Round.find(params[:round_id])
  erb :play

end

get '/game/start_round/:deck_id' do
  @deck = Deck.find(params[:deck_id])
  @cards = @deck.cards
  @active_card = @cards.pop
  @remaining_card_ids = @cards.map {|card| card.id}.join(",")
  p @remaining_card_ids
  
  @round = Round.create(:deck_id => @deck.id, :user_id => session[:user_id])

  
  erb :play
end
