class Deck
  attr_reader :front_desc, :back_desc, :cards, :discard_pile
  def initialize(args)
    @front_desc = args[:front_desc]
    @back_desc = args [:back_desc]
    @cards = args[:cards]
    @discard_pile = []
    shuffle_deck
    load_first_card
  end

  def name
    "#{front_desc} and #{back_desc}"
  end

  def shuffle_deck
    cards.shuffle!
  end

  def load_first_card
    next_card
  end

  def next_card
    discard_pile << cards.shift
  end

  def current_card
    discard_pile[-1]
  end

  def check_answer(answer)
    current_card.correct?(answer)
  end

  def finished?
    cards.empty?
  end
end
