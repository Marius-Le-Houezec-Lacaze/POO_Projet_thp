require_relative 'player'


class Game
  attr_accessor :human_player, :enemies_in_sight, :user, :players_left, :mechant
  def initialize(name, left = 10)
    @players_left = left
    @human_player = []
    @enemies_in_sight = []
    @user = HumanPlayer.new(name)
    @mechant = Player.new("mechant numero #{rand(1..100)}")
    @human_player << user
    @enemies_in_sight << @mechant
  end
  def kill_player(play)
    @enemies_in_sight.delete_at(play - 1)
  end
  def show_player
    puts 
    puts "Voicie tes point de vie : #{@human_player[0].life_points}\n"
    puts "Il reste #{@players_left} enemie \n"
  end
  def menu
    i = 0
    puts
    puts "a - Pours chercher une nouvelle arme"
    puts "s - Pour rechercher un pack de soin\n\n"
    while i < @enemies_in_sight.size
      print "#{i} - #{@enemies_in_sight[i].name} a #{@enemies_in_sight[i].life_points} point de vie|"
      i += 1
      puts
    end
  end
  def new_players_in_sight
    dice = rand(1..6)
    if enemies_in_sight.size <= @players_left && @players_left > 0
    
     if dice == 1
       puts "Aucun nouvelle enemie"
     elsif (dice < 5 && dice > 1)
       @mechant = Player.new("mechant numero #{rand(1..100)}")
       @enemies_in_sight << @mechant
       @players_left -= 1
     elsif (dice == 6)
       2.times do
         @mechant = Player.new("mechant numero #{rand(1..100)}")
         @enemies_in_sight << @mechant
       end
       @players_left -= 2
     end
    else
      puts "\nAucun Nouvelle enemie"
    end
  end
  def menu_choice(num)
    if num == "a"
      user.search_weapon
    elsif num == "s"
      user.search_health_pack
    elsif (num.to_i >= 0 && num.to_i <= @enemies_in_sight.size) && @enemies_in_sight[num.to_i].life_points > 0
      user.attacks(@enemies_in_sight[num.to_i])
      if @enemies_in_sight[num.to_i].life_points <= 0
        self.kill_player(num.to_i + 1)
      end
    else
      puts "Choix non valide"
    end
  end
  def enemies_attack 
    @enemies_in_sight.each do |w|
      w.attacks(user)
    end
  end
  def is_still_ongoing?
    (@user.life_points > 0 && @enemies_in_sight.size > 0 )? true : false
  end
  def end
    if @user.life_points <= 0
      puts "Dommage vous avez PERDU !!"
    elsif @enemies_in_sight.size == 0
      puts "Felicitation vous avez GAGNER !!"
    end
  end
end

=begin

=end

