require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------"
puts " Bienvenue sur Ils veulent tous ma POO !! Qui du duo José-Josiane ou toi va gagner ?"
puts "Quel est ton nom de combattant ?"
puts ">"

#Création du perso de l'utilisateur

name = gets.chomp
user = HumanPlayer.new(name)


#Création des ennemis et ajout dans un tableau
ennemis = []

player1 = Player.new("Josiane")
player2 = Player.new("José")
ennemis << player1
ennemis << player2

#Explication rapide

puts "Le joueur 1 s'appelle #{player1.name}. Le joueur 2 s'appelle #{player2.name}."
puts "Tu t'appelles #{name}. A chaque tour, tu vas pouvoir choisir d'effectuer une action. Une fois ton action effectuée, c'est au tour des Jojo de t'attaquer!"


#Boucle qui lance le jeu

while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0)

#La boucle tourne tant que les personnages ont des points de vie. On affiche l'état actuel de l'utilisateur (100pts de vie et arme de niveau 1)	
  user.show_state 
  puts ""
  puts "Quelle action veux-tu effectuer?"
  puts""
  puts "a : Chercher une meilleure arme"
  puts "s : Essayer de te soigner"
  puts ""
  puts "Buter l'un des ennemis:"
  puts ""
  puts "0 : Josiane. Elle a #{player1.life_points} points de vie."
  puts "1: José. Il a #{player2.life_points} points de vie." 
  

 

  puts ""
  puts ">"
  answer = gets.chomp.to_s 
  		puts ""

#L'utilisateur a fait son choix.

	if answer == "a" 
			puts "Tu as choisi de chercher une arme."
			user.search_weapon  

	elsif answer == "s"
			puts "Tu as choisi de te soigner."
			user.search_healthpack

	elsif answer == "0"
			puts "Tu as choisi de buter Josiane."
			if player1.life_points <= 0
 		    puts "Josiane est morte, ne la tape plus stp."
  			

  			else
			user.attacks(player1)
			end

	elsif answer == "1"
			puts "Tu as choisi de buter José."
			 if player2.life_points <= 0
 			 puts "José est mort, ne le tape plus stp."
		     
			else
			user.attacks(player2)
			end

	else 
			puts "Rentre une valeur a, s, 0 ou 1 sinon ça marche pas. Tant pis pour toi, tu as perdu un round, les Jojo ont pris de l'avance !"
			
	end
	puts "--------------------------------------------------------------"

#On passe à la seconde partie de la boucle, l'attaque des ennemis. Ils vont attaquer tant qu'ils ont des points de vie. Lorsque l'un d'entre eux n'en a plus, il n'attaque pas.
	puts "C'est maintenant au tour des Jojo de t'attaquer !"
	

		ennemis.each do |i|
		if i.life_points > 0
		i.attacks(user)

		end

		end 		
		
end

	puts "--------------------------------------------------------------"

#Conclusion et fin du game
		if user.life_points > 0 
			puts "Yesssss bg t'as gagné!"

		else 
			puts "Boloss t'as perdu :("
		end
