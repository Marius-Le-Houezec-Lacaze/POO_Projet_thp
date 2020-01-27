require 'bundler'
require 'pry'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("José")
player2 = Player.new("Josiane")

puts "A ma droite pesant 87 kilos #{player1.name}"
sleep(1)
puts "A ma gauche pesant 84 kilos #{player2.name}"
puts 
sleep(1)
puts "Passons à la phase d'attaque :"
puts 
loop do
  (player2.life_points <= 0)? break : nil
  player2.attacks(player1.name)
  sleep(1)
  (player1.life_points <= 0)? break : nil
  player1.attacks(player2.name)
  sleep(1)
  puts
  puts "Voici l'état de nos joueurs :"
  sleep(1)
  puts "#{player1.name} a #{player1.life_points} point de vie"
  puts "#{player2.name} a #{player2.life_points} point de vie "
  puts
end

binding.pry