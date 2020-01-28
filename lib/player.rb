class Player 
  attr_accessor :life_points, :name, :enemies
  @@enemies = []

  def initialize(nom)
    @name = nom.to_s
    @life_points = 10
    @@enemies << self
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie"
  end

  def gets_damage(int)
    @life_points -= int
    (@life_points <= 0 )? 
    (puts "Le joueur #{@name} a été tué !"): 
    nil
  end

  def compute_damage
    rand(1..6)
  end

  def attacks(player)
    degat = self.compute_damage
    puts "#{@name} a attaquer #{player.name}"
    puts "Il lui inflige #{degat} point de dommages"
    @@enemies.each do |play|
      (play.name == player.name) ? 
      (play.gets_damage(degat)):
      nil
    end
  end
end

class HumanPlayer < Player
  attr_accessor :weapon_levels
  def initialize(nom)
    @name = nom.to_s
    @weapon_level = 1
    @life_points = 100
    @@enemies << self
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    dice = rand(1..6)
    puts "Genial tu a trouver une arme de niveaux #{dice}"
    if (dice > @weapon_level)
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends.\n\n"
      @weapon_level = dice
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle...\n\n"
    end
  end

  def search_health_pack 
    dice = rand(1..6)
    case dice
    when 1
      puts "Tu n'as rien trouver"
    when (2..5)
      @life_points += 50
      @life_points = @life_points.clamp(0, 100)
    when 6
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
      @life_points += 80
      @life_points = @life_points.clamp(0, 100)
    end
  end
end