require_relative 'deck'
require_relative 'card'
require_relative 'deckloader'
require_relative 'view'

require 'colored'

class Controller
  attr_reader :deck

  def initialize
    @deck = load_deck
    run
  end

  def load_deck
    deck_list = Dir["*.csv"].map {|file| file[0..-5]}
    deck = ""
    until deck_list.include?(deck) || deck == "exit"
      View.display_decks(deck_list)
      deck = View.get_input
    end
    DeckLoader.create(deck)
  end

  def run
    View.welcome(deck.name)
    until deck.finished?
      View.show_card(deck)
      answer = View.get_answer(deck)
      correct = check_answer(answer)
      if correct
        View.correct
      else
        View.incorrect(deck.current_card)
      end
      deck.next_card
    end
  end

  def check_answer(answer)
    deck.check_answer(answer)
  end
end

Controller.new
