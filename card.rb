class Card
  def initialize(args)
    @id = id
    @front = front
    @back = back
  end

  def correct?(side_guessed, answer)
    side = instance_variable_get("@#{side_guessed}")
    side == answer
  end
end
