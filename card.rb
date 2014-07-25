class Card
  attr_reader :front, :back, :id

  def initialize(args)
    @id = args[:id]
    @front = args[:front]
    @back = args[:back]
  end

  # Future feature for reversing card guessing
  # def correct?(side_guessed, answer)
  #   side = self.send(side_guessed)
  #   side == answer
  # end

  def correct?(user_answer)
    user_answer.downcase == back.downcase
  end
end
