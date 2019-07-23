require 'bundler'

Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

=begin
------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
|A la fin il n'en restera qu'un. Denis Brogniard|
|Musique Koh lanta ou Highlander au choix       |
-------------------------------------------------
=end

puts "Hero quel est ton nom?"
 @name = gets.chomp

human = HumanPlayer.new(@name)

player1 = Player.new("Josiane")
player2 = Player.new("José")

enemies = Array.new

while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0) #condition pour terminer le jeux soit joueur encore vivant soit joueur mort
    puts
	puts human.show_state
	puts
	puts "Quelle action veux-tu effectuer ?"
    puts  "a - chercher une meilleure arme"
    puts "s - chercher à se soigner" 
    puts "Attaquer un joueur en vue :"
    puts "0 - Josiane a #{player1.life_points} points de vie"
    puts "1 - José a #{player2.life_points} points de vie"

    case choice # comme un switch en C
		when "a"
			human.search_weapon
		when "s"
			human.search_health_pack
		when "0"
			human.attacks(player1)
		when "1"
			human.attacks(player2)
	end

	enemies.each do |enemies_vivant| # enemies attaque
		if enemies_vivant.life_points > 0 # si l'enemies et encore vivant il peut attaquer
		puts "\nAttention ! Les autres joueurs t'attaquent !" 
		puts
		enemies_vivant.attacks(human)
		end
    end
    
end
#message de fin de partie
    puts "La partie est finie"

if human.life_points > 0
    puts  "BRAVO ! TU AS GAGNE !"
else
    puts "Loser ! Tu as perdu !"
end