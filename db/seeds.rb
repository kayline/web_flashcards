require 'faker'

20.times do 
  User.create(:name => Faker::Name.name, :email => Faker::Internet.free_email, :password => 'password')
end


40.times do
  rand = 1 + rand(2)
  Round.create(correct: rand, incorrect: rand, unanswered: rand, deck_id: rand, user_id: rand) 
end

module DeckSeeder

  def initialize
  end

  def self.deck_seed
    deck1 = Deck.create(name: 'Deck 1', topic: 'Numbers')
    1.upto(5) do |num|
      deck1.cards << Card.create(question: "What is #{num}?", answer: num)
    end

    deck2 = Deck.create(name: 'Deck 2', topic: 'Numbers')
    6.upto(10) do |num|
      deck2.cards << Card.create(question: "What is #{num}?", answer: num)
    end
  end

  
end

DeckSeeder::deck_seed
