require './player'
require './question'

class Game

  def initialize # creates two players below
    @player_one = Player.new("P1")
    @player_two = Player.new("P2")
    @current_player = @player_one # sets the current player to player_one
  end

  def current_player #  method is used for retrieving and returning the current player's object
    @current_player
  end

  def display_scores
    puts "Player 1: #{@player_one.lives}/3 vs Player 2: #{@player_two.lives}/3"
  end

  def switch_turns
    @current_player = (@current_player == @player_one) ? @player_two : @player_one
  end

  def start # method begins the game loop
    loop do
      puts "----- NEW TURN -----"
    
      question = Question.new # Generates a new random question using the Question class

      puts "#{current_player.name}: #{question.question}"

      player_answer = gets.chomp.to_i # Reads the player's answer from the console input

      if player_answer == question.answer # Checks if the answer is correct
        puts "YES! You are correct!"
      else
        puts "Seriously? No!" # updates the player's lives if the answer is wrong
        current_player.lives -= 1
      end


      display_scores # <-- method is called 

      if current_player.lives == 0
        end_game
        break
      end

      switch_turns # <-- method is called
    end
  end

  def end_game
    winner = (@player_one.lives > @player_two.lives) ? @player_one : @player_two
    puts "#{winner.name} wins with a score of #{winner.lives}/3"
    puts "Game over!"
    puts "Good bye!"
  end
end
