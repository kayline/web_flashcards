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
