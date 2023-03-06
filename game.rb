class Game
  attr_accessor :player1, :player2, :current_player

  def initialize (name1, name2)
    @player1 = Player.new(name1)
    @player2 = Player.new(name2)
    @current_player = @player1
  end

  def generate_question
    operations = [{ name: 'plus', operator: :+ },
                  { name: 'minus', operator: :- },
                  { name: 'multiplied by', operator: :* }]

    index = rand(0..2)
    num1 = rand(1..20)
    num2 = rand(1..20)
    answer = num1.send(operations[index][:operator], num2)
  
    [num1, num2, answer, operations[index][:name]]
  end

  def play
    operations = [
      { name: 'plus', operator: :+ },
      { name: 'minus', operator: :- },
      { name: 'multiplied by', operator: :* }
    ]

    while player1.lives > 0 && player2.lives > 0
      puts '----- NEW TURN -----'
      num1, num2, answer, operation_name = generate_question

      puts "#{current_player.name}: What does #{num1} #{operation_name} #{num2} equal?"
      print '>> '
      response = gets.chomp.to_i

      if response != answer
        current_player.lose_life

        puts ""
        puts "#{current_player.name}: Seriously? No!"
        puts ""
        puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"
        puts ""

        switch_player
      else
        puts ""
        puts "#{current_player.name}: Correct! Next question..."
        puts ""
      end
    end

    game_over
  end

  def switch_player
    @current_player = (@current_player == player1) ? player2 : player1
  end

  def game_over
    winner = player1.lives > 0 ? player1 : player2
    loser = player1.lives > 0 ? player2 : player1
    puts '----- GAME OVER -----'
    puts "#{winner.name} wins with a score of #{winner.lives}/3"
    puts "#{loser.name} has a score of #{loser.lives}/3"
    puts ""
    puts 'Good bye!'
  end
end
