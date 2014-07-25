require 'csv'

module DeckLoader
  def self.create(file)
    deck_args = generate_deck_args(file)
    Deck.new(deck_args)
  end

  private

  def self.generate_deck_args(file)
    { front_desc: get_front_desc(file), back_desc: get_back_desc(file), cards: get_cards(file) }
  end

  def self.get_front_desc(file)
    csv_as_array(file)[0][0]
  end

  def self.get_back_desc(file)
    csv_as_array(file)[0][1]
  end

  def self.get_cards(file)
    cards = csv_as_array(file)[1..-1]
    cards.map.with_index { |card_side, index| Card.new(front: card_side[0], back: card_side[1], id: index + 1) }
  end

  def self.csv_as_array(file)
    CSV.read("#{file}.csv")
  end
end
