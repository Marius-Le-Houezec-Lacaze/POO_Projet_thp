require 'bundler'
require 'pry'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "Rentre ton nom"
print ">"
my_game = Game.new(gets.chomp)

while(my_game.is_still_ongoing? == true)
  my_game.show_player
  my_game.menu
  print '>'
  my_game.new_players_in_sight
  my_game.menu_choice(gets.chomp)
  my_game.enemies_attack
end
my_game.end

binding.pry