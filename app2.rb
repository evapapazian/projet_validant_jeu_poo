require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------"
puts " Bienvenue sur Ils veulent tous ma POO !! Qui du duo José-Josiane ou toi va gagner ?"
puts "Quel est ton nom de combattant ?"
puts ">"

name = gets.chomp
user = HumanPlayer.new(name)

ennemis = []

player1 = Player.new("Josiane")
player2 = Player.new("José")
ennemis << player1
ennemis << player2



puts "Le joueur 1 s'appelle #{player1.name}. Le joueur 2 s'appelle #{player2.name}."
puts "Tu t'appelles #{name}."

while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
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

		if answer == "a" 
			puts "Tu as choisi de chercher une arme."
			user.search_weapon  

		elsif answer == "s"
			puts "Tu as choisi de te soigner."
			user.search_healthpack

		elsif answer == "0"
			puts "Tu as choisi de buter Josiane."
			user.attacks(player1)

		elsif answer == "1"
			puts "Tu as choisi de buter José."
			user.attacks(player2)

		else 
			puts "Rentre une valeur a, s, 0 ou 1 sinon ça marche pas."
			
		end
	puts ""
	puts "C'est maintenant au tour des Jojo de t'attaquer !"
	
	if (player#{i}
		ennemis.each do |i|
		i.attacks(user)

	if (player2.life_points >0)
		ennemis.each do |i|
		i.attacks(user)


		 end

	end 


	




		#break if user.life_points <= 0 
			#puts "Tu es mort, VDM."


		#break if player1.life_points <= 0 || player2.life_points <= 0
			#puts "T'as gagné youhouuuu bg"
		
end

