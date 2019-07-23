#require 'pry'


class Player 
    attr_accessor :name, :life_points

    def initialize name_player # Initialise la valeur de player et ces points de vie
        @name = name_player
        @life_points = 10
    end

    def show_state # montre l'état du joueur
        print "#{@name} a #{@life_points} point de vie"
    end

    def gets_damage(dmg) # Calcul des dégats reçu et mets a jour les points de vie
        @life_points=life_points-dmg
         if @life_points<= 0 # Si point de vie et <= à 0 alors affiché qu'il est mort
            puts "le joueur #{@name} à été tué"
        end
        new_dmg=@life_points
        return new_dmg
    end

    def attacks(player)# déclare qui attaque qui et affiche les dégas reçu
        puts "#{self.name} attaque #{player.name}"
        damage=compute_damage
        player.gets_damage(damage)
		puts "#{self.name} lui inflige #{damage} points de dommages"
        
    end

    def compute_damage#genere des dommage aléatoire entre 1 et 6
    return rand(1..6)
    end


end
#binding.pry