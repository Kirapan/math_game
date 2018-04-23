require './players.rb'
require 'byebug'

class Game
    def initialize
        byebug
        player1 = Player.new('Player 1')
        player2 = Player.new('Player 2')
        @players = [player1, player2]
        @current_player = @players.first
    end

    def play
        while (!game_over?)
            @current_player = @players.first
            
            the_other_player = @players.last
            puts "----- NEW TURN -----"
            number1 = rand(10)
            number2 = rand(10)
            puts "#{@current_player.name}: What does #{number1} plus #{number2} equal?"
            prompt = "> "
            answer = $stdin.gets.chomp
            correct_answer = number1 + number2
            validate(answer, correct_answer)
            swap_current_player
            print_summary(@current_player, the_other_player)
        end
        end_of_game

    end

    private

    def validate(answer, correct_answer)
        if answer == correct_answer.to_s
            puts "#{@current_player.name}: YES! You are correct."
        else
            puts "#{@current_player.name}: Seriously? No!"
            @current_player.lose_lives
        end
    end

    def game_over?
        @players.any? { |player| player.is_dead? }
    end

    def swap_current_player
        @players.rotate!
    end

    def print_summary(player_one, player_two)
        puts player_one.name == "Player 1"? "P1: #{player_one.lives}/3 vs P2: #{player_two.lives}/3" : "P1: #{player_two.lives}/3 vs P2: #{player_one.lives}/3"
    end

    def end_of_game
        puts "#{@players.first.name} wins with a score of #{@players.first.lives}/3"
        puts "----- GAME OVER -----"
        puts "Good bye!"
    end
end
