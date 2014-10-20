
module View
  class << self
    def display_decks(decks)
      puts "Please choose a deck from the following:"
      puts decks
      puts "..."
    end

    def welcome(name)
      spacing
      puts "Welcome to flashy flashcards"
      puts "The current deck is:"
      puts name.blue
      spacing
    end

    def get_input
      gets.chomp
    end

    def show_card(deck)
      puts "If #{deck.front_desc} is..."
      puts deck.current_card.front.blue
    end

    def get_answer(deck)
      puts "...then what is #{deck.back_desc}?"
      get_input
    end

    def correct
      spacing
      puts "CORRECT!".green
      spacing
    end

    def incorrect(card)
      spacing
      puts "Sorry, the correct answer is:"
      puts card.back.red
      spacing
    end

    def spacing
      puts "\n\n"
    end
  end
end
