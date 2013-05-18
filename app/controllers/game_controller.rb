get '/game' do
  erb :new_game
end

get '/game/round_complete' do
  erb :round_complete
end


post '/game/:round_id' do
  @round = Round.find(params[:round_id])
  @answer = Card.find(params[:current_card_id]).answer
  @remaining_card_ids = params[:remaining_card_ids].split(",")
  @remaining_cards_count = @remaining_card_ids.length
  @round.update_attributes(:unanswered => @remaining_cards_count)

  if @remaining_card_ids.empty?
    puts "no more cards"
    redirect '/game/round_complete'
  else
    @active_card = Card.find(@remaining_card_ids.pop)
    @remaining_card_ids = @remaining_card_ids.join(",")
    if params[:guess] == @answer
      puts "Got it right!"
      new_count = @round.correct + 1
      @round.update_attributes(:correct => new_count)
    else
      new_count = @round.incorrect + 1
      @round.update_attributes(:incorrect => new_count)
      puts "Wrong!"
    end
    erb :play
  end
   
end


get '/game/start_round/:deck_id' do
  @deck = Deck.find(params[:deck_id])
  @cards = @deck.cards
  @active_card = @cards.pop
  @remaining_card_ids = @cards.map {|card| card.id}.join(",")
 
  
  @round = Round.create(:deck_id => @deck.id, :user_id => session[:id], :unanswered => @cards.length)

  
  erb :play
end
