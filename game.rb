require './generate_question'

class Game
  attr_accessor :player1, :player2, :current_player

  def initialize (player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = @player1
  end

  def play
    while player1.has_life? && player2.has_life?
      
      num1, num2, answer, operation_name = generate_question

      puts "#{current_player.name}: What does #{num1} #{operation_name} #{num2} equal?"
      puts "If your answer is a decimal number, round it to an integer."
      print '>> '
      response = gets.chomp.to_i

      if response != answer
        current_player.lose_life

        puts "\n#{current_player.name}: Seriously? No!\n\n"
        puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3\n\n"

        if current_player.lives
          switch_player
        end
      else
        puts "\n#{current_player.name}: Correct! Next question...\n\n"
      end
    end

    game_over
  end

  private

  def switch_player
    puts '----- NEW TURN -----'
    @current_player = (@current_player == player1) ? player2 : player1
  end

  def game_over
    winner = player1.has_life? ? player1 : player2
    loser = player1.has_life? ? player2 : player1
    puts '----- GAME OVER -----'
    puts "#{winner.name} wins with a score of #{winner.lives}/3"
    puts "#{loser.name} has a score of #{loser.lives}/3\n\n"
    puts 'Good bye!'
  end

  def generate_question
    GenerateQuestion.call
  end
end
