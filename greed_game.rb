###### To initialize players & their score

  class Player 
    attr_accessor :name, :current_turn_score, :player_count

    def initialize(name, current_turn_score, player_count = 1)
      @name = name
      @current_turn_score = 0
    end
  end

  ###### Rolling Dice

  class DiceSet
    attr_accessor :dices_count

  def initialize(dices_count = 1)
    @dices_count = dices_count
  end

    def roll  
      dice_values = []
      @dices_count.times do
        dice_values.push(rand(1..6))
      end
      return dice_values

    end
  end


  ###### Scoring 

  class Scoreing 

    def score(dice)

        result = 0

        # You need to write this method
        if dice == []
          return 0
          
        end

        if dice.count(1) == 5
          result += 1200
        end

        if dice.count(1) == 4
          result += 1100
        end

        if dice.count(5) == 4
          result += 550
        end
            
           
      # set of three ones 
        if dice.count(1) == 3  #A set of three ones 
           result += 1000
        elsif dice.count(1) == 2 #for two ones 
           result += 200
        elsif dice.count(1) == 1 #for single one
           result += 100
        end

      #A five (that is not part of a set of three)
        if dice.count(5) == 2
           result += 100 
        elsif dice.count(5) == 1
          result += 50
        end

      #A set of three numbers (other than ones)
        if dice.count(2) == 3
          result += 200
        elsif dice.count(3) == 3
          result += 300
        elsif dice.count(4) == 3
          result += 400
        elsif dice.count(5) == 3
          result += 500
        elsif dice.count(6) == 3
          result += 600
        end


        return result
    end
  end


class Start

  attr_accessor :players

  def make_player(number)

    @players = []

    number.times do 

      puts "Enter Your name"
      name = gets.chomp

      p1 = Player.new(name, 0)
      @players.push(p1)

    end
  end


  def play(players)

    while(true) 
      players.each do |player|
        r1 = DiceSet.new(5)
        dice_value = r1.roll
        puts dice_value
        s1 = Scoreing.new
        result = s1.score(dice_value)
        puts "Current turn score of #{player.name} is #{result}"
        
        if result == 0
          player.current_turn_score = 0
          next
        else
          player.current_turn_score += result
          puts "Total score of #{player.name} is #{player.current_turn_score}"
        end
        if player.current_turn_score < 3000
          puts "Do you want to continue?(y/n)"
          continue = gets.chomp
          if continue == "y"
            redo
          else
            next
          end
        else
          puts "#{player.name} is Winner"
            return player
        end
      end
    end
  end
end

###### Start Game =>

puts "How many number of players you want?"
number = gets.chomp.to_i

game = Start.new
game.make_player(number)
game.play(game.players)
