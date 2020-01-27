require 'bundler'
require 'pry'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts " 
------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"

player1 = Player.new("José")
player2 = Player.new("Josiane")
user = HumanPlayer.new("Joueur")

while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
  puts "Point de vie : #{user.life_points}"
  puts "Quelle action veux-tu effectuer ?"
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner"
  puts
  puts "attaquer un joueur en vue :"
  if player1.life_points > 0
    puts "0 - #{player1.name} a #{player1.life_points} points de vie"
  else
    puts "#{player1.name} Est mort"
  end
  if player2.life_points > 0
    puts "1 - #{player2.name} a #{player2.life_points} points de vie"
  else
    puts "#{player2.name} Est mort"
  end
  print ">"
  action = gets.chomp
  case action.to_s
  when "a"
    user.search_weapon
  when "s"
    user.search_health_pack
  when "0"
    user.attacks(player1)
    puts "test"
  when "1"
    user.attacks(player2)
  else
    puts "Mauvaise commande"
  end
  puts
  puts "Les autres joueurs t'attaquent !"
  player1.attacks(user)
  puts
  player2.attacks(user)
  puts
end
binding.pry