class Player

  attr_accessor :lives, :turn, :name

  def initialize(name)
    @lives = 3
    @turn = true
    @name = name
  end

end