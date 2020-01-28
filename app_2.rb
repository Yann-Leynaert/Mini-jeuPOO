require 'bundler'
Bundler.require

require_relative 'lib/game.rb'
require_relative 'lib/player.rb'

puts "--------------------------------"
puts " |HUMANS VS ROBOT|UNTIL DEATH|"
puts "--------------------------------"
puts ""

puts "Quel est ton prenom?"
user = HumanPlayer.new(gets.chomp.to_s)

puts user.show_state

player1 = Player.new("Josiane")
player2 = Player.new("José")
  enemies = []
  enemies << player1
  enemies << player2

while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
  puts "Voici l'état de chaque joueur:"
    user.show_state
    player1.show_state
    player2.show_state
    puts ""
    puts"Passons à la phase d'attaque:"
    user.attacks(player1) 
    user.attacks(player2)
    if user.life_points <= 0 && (player1.life_points <= 0 || player2.life_points <= 0) 
      break
    end 
    player1.attacks(user)
    player2.attacks(user)
    user.show_state
end 
puts "Bravo tu as gagné!"






