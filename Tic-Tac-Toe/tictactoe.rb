require "./game"
require "./player"
def TicTacToe()
      game=Game.new
      puts "Tic-Tac-Toe Game"
      game.board.displayCells
      
      players=Array.new(2)
      puts "Hello enter player 1's name then hit Enter"
      players[0]=Player.new(gets.chomp)

      puts "Enter player 2's name then hit Enter"
      players[1]=Player.new(gets.chomp)

     
      i=0
      
      value=""
      while (value!="exit" && !game.tie )
      	
	  puts "#{players[i].name}'s turn: "
        game.display
        value=gets.chomp
        if game.enterValue(value.to_i, players[i].token)
      	game.display
      	if game.gameOver(value.to_i,players[i].token)
      	 puts "-------#{players[i].name} WINS------"
      	 exit 0
      	end
      	i==0? i=1 : i=0
         end
      end
      exit 0
     
   end


TicTacToe()