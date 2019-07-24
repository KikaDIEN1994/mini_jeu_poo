require 'bundler'

Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("josiane")
player2 = Player.new("jose")

while player1.life_points > 0 && player2.life_points > 0 # condition du combat a mort
        puts
        
		puts "Voici l'état de chaque joueurs : "
		puts player1.show_state
        puts player2.show_state 

        puts
        
		puts "Passons à la phase d'attaque :"
    
        player1.attacks(player2)
	if player2.life_points <= 0
		puts
		break
	 else 
		player2.attacks(player1)
		puts
	end	
end