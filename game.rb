class Game
  attr_accessor :player1, :player2, :current_player

  def initialize
    @player1 = Player.new
    @player2 = Player.new
    @current_player = @player1
  end

  def ask_question
    operations = [
      { name: 'plus', operator: + }
    ]
    index = rand(0..3)
    num1 = rand(1..20)
    num2 = rand(1..20)
    puts "#{current_player}: What does #{num1} #{num2} equal?"
    answer = gets.chomp

  end

  def play_round
    "Play!"
  end

  def switch_player
    current_player = (current_player == player1) ? player2 : player1
    '----- NEW TURN -----'
  end
end
