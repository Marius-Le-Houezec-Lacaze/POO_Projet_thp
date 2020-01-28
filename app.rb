require 'bundler'
require 'pry'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("José")
player2 = Player.new("Josiane")

puts "Voici l'état de nos joueurs :"
player1.show_state
player2.show_state
sleep 1
puts 
loop do
  puts "Passons à la phase d'attaque :"
  (player2.life_points <= 0)? break : nil
  player2.attacks(player1)
  sleep(1)
  (player1.life_points <= 0)? break : nil
  player1.attacks(player2)
  sleep(1)
  puts
  puts "Voici l'état de nos joueurs :"
  sleep(1)
  player1.show_state
  player2.show_state
  puts
end
(player1.life_points > 0)? 
(puts "\n José a gagner le combat"): 
(puts "\n Josianne a gagner le combat")