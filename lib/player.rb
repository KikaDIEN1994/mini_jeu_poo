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
        new_dmg = @life_points
        return new_dmg
    end

    def attacks(player)# déclare qui attaque qui et affiche les dégas reçu
        puts "#{self.name} attaque #{player.name}"
        damage = compute_damage
        player.gets_damage(damage)
		puts "#{self.name} lui inflige #{damage} points de dommages"
        
    end

    def compute_damage#genere des dommage aléatoire entre 1 et 6
    return rand(1..6)
    end


end

class HumanPlayer < Player #class HumanPlayer qui hérite de la classe Player 
    attr_accessor :weapon_level

    def initialize #Nouvelle valeur d'initialisation
        @name = name
        @life_points = 100
        @weapon_level = 1
    end

    def show_state #Nouvelle valeur PV
        puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
    end

    def compute_damage# nouvelle valeur de damage
        rand(1..6)*@weapon_level
    end

    def search_weapon#nouvelle attribution de weapon
        lvl=rand(1..6)
        puts "Tu as trouvé une arme de niveau #{lvl}"
        if @weapon_level<lvl
        @weapon_level=lvl
        puts "Selection de la nouvelle arme"
        else
        puts "Pas terrible tu garde l'ancienne"
        end
    end

    def search_health_pack#pack de soin
        health=rand(1..6) 

        if health == 1
          puts "Tu n'as rien trouvé ..."
          
        elsif health.between?(2,5)
            puts "Bravo, tu as trouvé un pack de +50 points de vie !"
            
            if @life_points + 50 > 100
                @life_points = 100
                
            else
                @life_points += 50
            end
            
        elsif result == 6
            health "Waow, tu as trouvé un pack de +80 points de vie !"
            
            if @life_points + 80 > 100
                @life_points = 100
                
            else
                @life_points += 80
            end
        end   
        
    end
end
#binding.pry