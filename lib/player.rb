require 'pry'

#Cette classe a pour but de manipuler les Players, qui seront nos ennemis dans le jeu final (rpz Josiane). Attention, il y a beaucoup de commentaires!


class Player

attr_accessor :name
attr_accessor :life_points



def initialize (name)
	@name = name.to_s 			#Cette def permet de set up un nom au player MAIS garde le nombre de pts de vie égal pour tous (tous partent avec 10pts)
	@name = name
	
	@life_points = life_points.to_s
	@life_points = 10
end



def show_state
	 puts "#{name} a #{life_points} points de vie."	#Cette def affiche l'état de santé actuel du personnage
end



def gets_damage(a)
	@life_points = (@life_points - a) 	#Cette def affiche les dégâts infligés à un joueur (ici ces dégâts sont entrés manuellement, via la variable a)
	if @life_points <= 0
		puts "Le joueur #{name} est mort !"	#Quand les points de vie du joueur sont inférieurs ou égals à zéro, on indique la mort de celui-ci
	end
end



def attacks(player)
	puts "#{name} attaque #{player.name} ! " #name renvoie au joueur qui attaque (puisque c'est à lui qu'on applique la def attack (et c'est l'autre qui subit))
	damage_received = compute_damage		#Ici, on créée une variable damage_received qui correspond à un chiffre alétoirement choisi entre 1 et 6, par la variable compute_damage

	puts "#{name} inflige #{damage_received} points de dégât à #{player.name}."	#Affiche le nom du joueur qui attaque, le dégât et le nom du joueur attaqué
	player.gets_damage(damage_received)	#la fonction gets_damage entre en jeu: le damage_received correspond au a 
end



def compute_damage
    return rand(1..6)				#cette def simule un lancer de dé et retourne un chiffre alétoire entre 1 et 6 
end

end


#-------------------------------------------------------------------


class HumanPlayer < Player
attr_accessor :weapon_level				#ici, on définit une seconde classe, qui correspondra à l'utilisateur ("joueur humain"). Cette classe hérite de la classe Player et prend ses méthodes et variables
										#on ajoute la variable weapon_level car elle n'existe pas dans Player. Elle ne sera applicable qu'au HumanPlayer.

def initialize(name)
	@name = name
	@life_points = life_points.to_i		#on initialize le HumanPlayer avec 100pts de vie et une arme de niveau 1
	@life_points = 100
	@weapon_level = 1

end



def compute_damage
    rand(1..6) * @weapon_level			#Cette def permet de rendre les dégâts infligés par le HumanPlayer plus importants: les dégâts correspondent à un nombre alétoirement choisi entre 1 et 6 * le niveau de l'arme
  end


def search_weapon
	weapon_found = rand(1..6)								#Cette def permet à l'utilisateur de rechercher une arme de meilleure qualité. Le niveau de la nouvelle arme sera compris entre 1 et 6, aléatoirement choisi.
	puts "tu as trouvé une arme de niveau #{weapon_found}"
	if weapon_found > @weapon_level							#Si l'arme trouvée a une meilleure valeur que l'arme initiale, alors l'arme initiale prend la valeur de l'arme trouvée.
		@weapon_level = weapon_found
		puts "Youhou elle est meilleure que ton arme actuelle ! Go la prendre."
	else 
		puts "Oh nan elle est nulle, VDM. Garde la première!"
		return @weapon_level
	end

end



def show_state
	puts "#{name} a #{life_points} points de vie et une arme de niveau #{weapon_level}."		#Cette def affiche le nombre de pts de vie et le niveau de l'arme de l'utilisateur
end



def search_healthpack						#Cette def def permet de rechercher des points de vie. 
	lancer = rand(1..6)

	if lancer == 1
		puts "Tu n'as rien trouvé..."

	elsif lancer == (2..5)
		@life_points = @life_points + 50
		puts "Yessss, tu as gagné 50pts de vie!"
			if @life_points > 100						#Cette partie a pour but d'empêcher l'utilisateur d'atteindre plus de 100pts de vie
				@life_points = 100
			end

	else 
		
		@life_points = @life_points + 80
		puts "Wow, tu as gagné 80 points de vie !!"
			if @life_points > 100
				@life_points = 100 
			end
	end 
end




end



#binding.pry
