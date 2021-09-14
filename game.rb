require_relative './player'

class Game

  def initialize
    @p1 = Player.new('Player1')
    @p2 = Player.new('Player2')
    @players = [@p1,@p2]
  end

  def question
    num1 = rand(1..20)
    num2 = rand(1..20)

    @player = @players.first
    @total = num1 + num2
    puts "#{@player.name}:What does #{num1} plus #{num2} equal?"
  end
  
  def answer
    answer = gets.chomp.to_i
    if answer == @total
      puts "#{@player.name}: You are correct."
    else
      puts "#{@player.name}: This is incorrect."
      @player.life-=1
    end
  end

  def display_score
    puts "P1: #{@p1.life}/3 vs P2: #{@p2.life}/3 "
  end

  def new_turn
    puts "----- NEW TURN -----"
    @players.rotate!
  end

  def result
    @p1.loser? ? winner = @p2 : winner = @p1
   
    puts "#{winner.name} wins with a score of #{winner.life}/3."

    puts "----- GAME OVER -----\nGood Bye!"
  end

  def play
    until @p1.loser? || @p2.loser?
      question
      answer
      display_score
      new_turn
    end
    result
  end


end