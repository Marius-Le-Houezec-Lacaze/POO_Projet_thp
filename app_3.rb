require 'bundler'
require 'pry'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "Rentre ton nom"
print ">"
my_game = Game.new(gets.chomp, 1)

while(my_game.is_still_ongoing? == true)
  my_game.show_player
  my_game.menu
  my_game.menu_choice(gets.chomp)
  my_game.enemies_attack
  my_game.new_players_in_sight
end
my_game.end
