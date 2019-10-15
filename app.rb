require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")


puts "Le joueur 1 s'appelle #{player1.name}. Le joueur 2 s'appelle #{player2.name}"
puts ""
puts "Voici l'état de chaque joueur:"

puts "#{player1.name} a #{player1.life_points} points de vie. #{player2.name} a #{player2.life_points} points de vie."
puts ""
puts "Passons à la phase d'attaque !"

puts "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
puts""


while player1.life_points > 0 && player2.life_points > 0
	  player1.attacks(player2)

	if player1.life_points > 0 && player2.life_points > 0
	   player2.attacks(player1)
	   puts "#{player1.name} a #{player1.life_points} points de vie. #{player2.name} a #{player2.life_points} points de vie."
	   puts ""
		

	end
	
	end

	puts "Le combat est terminé !"
	



binding.pry
#break if blablabla