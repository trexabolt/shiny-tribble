class Player
  attr_accessor :name, :score
  def initialize(name)
    @name = name
    @score = 0
  end
end

class GameBoard
  attr_accessor :players, :turn
  def initialize
    @players = []
    @turn = 0
  end

  def add_player(name)
    @players << Player.new(name)
  end

  def roll_dice
    rand(1..6)
  end

  def play_turn
    current = @players[@turn % @players.size]
    points = roll_dice
    current.score += points
    puts "#{current.name} rolled #{points}, total score: #{current.score}"
    @turn += 1
  end

  def show_scores
    @players.each { |p| puts "#{p.name}: #{p.score}" }
  end
end

board = GameBoard.new
board.add_player("Ari")
board.add_player("Ben")
5.times do
  board.play_turn
  board.show_scores
end

puts "Board Game Ended."