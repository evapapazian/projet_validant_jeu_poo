require 'pry'

class Player

attr_accessor :name
attr_accessor :life_points



def initialize (name)
	
	@name = name.to_s 			#def qui permet de set up un nom au player MAIS garde le nombre de pts de vie égal pour tous (tous partent avec 10pts)
	@name = name
	
	@life_points = life_points.to_s
	@life_points = 10

	
end


def show_state
	 
	puts "#{name} a #{life_points} points de vie."
end


def gets_damage(a)


	#a = a.to_i   pas forcément nécessaire 
 

	@life_points = (@life_points - a) 
	

	if @life_points <= 0
		puts "Le joueur #{name} est mort !"
	end
end


def attacks(player)

puts "#{name} attaque #{player.name} ! " #name renvoie au joueur qui attaque (puisque 	c'est à lui qu'on applique la def attack (et c'est l'autre qui subit))

damage_received = compute_damage



puts "#{name} inflige #{damage_received} points de dégât à #{player.name}."
player.gets_damage(damage_received)
end



def compute_damage
    return rand(1..6)
end

end

#-------------------------------------------------------------------
class HumanPlayer < Player
	attr_accessor :weapon_level 



def initialize(name)
	@name = name
	@life_points = life_points.to_i
	@life_points = 100
	@weapon_level = 1

end



def compute_damage
    rand(1..6) * @weapon_level
  end


def search_weapon
	weapon_found = rand(1..6)
	puts "tu as trouvé une arme de niveau #{weapon_found}"
	if weapon_found > @weapon_level
		@weapon_level = weapon_found
		puts "Youhou elle est meilleure que ton arme actuelle ! Go la prendre."
	else 
		puts "Oh nan elle est nulle, VDM. Garde la première!"
		return @weapon_level
	end

end



def show_state
	 
	puts "#{name} a #{life_points} points de vie et une arme de niveau #{weapon_level}."
end



def search_healthpack
	lancer = rand(1..6)

	if lancer == 1
		puts "Tu n'as rien trouvé..."

	elsif lancer == (2..5)
		@life_points = @life_points + 50
		puts "Yessss, tu as gagné 50pts de vie!"

	else 
		
		@life_points = @life_points + 80
		puts "Wow, tu as gagné 80 points de vie !!"
	end
end




end



#binding.pry
