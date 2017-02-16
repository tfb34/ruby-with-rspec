require "./board"
class Game
    
  attr_reader :board
	def initialize
       @board=Board.new(3,3)
       #@gameOver=false
       @numOfTurns=9
	end

    

	def winByColumn(col,token)

      0.upto(@board.columns-1) do |r|   
        #if @grid[r][col].count(token)<1
        if @board.grid[r][col].count(token)<1
          return false
        end
      end
      return true
    end
     #put into tictactoe class
    def winByRow(row,token)
      0.upto(@board.rows-1) do |c| 
       if @board.grid[row][c].count(token)<1
        return false
       end  
      end
      return true
    end
  # put into another class
    def winDiagonal(token)
      #check if diagonal
      if upDiagonal(token) || downDiagonal(token)
        return true
      else
        return false
      end
    end

    def downDiagonal(token)#checks cells [0,0],[1,1],[2,2]
    	0.upto(@board.rows-1) do |i|
    		if @board.grid[i][i].count(token)<1
    			return false
    		end
    	end
    	puts "downward diagonal win"
    	return true
    end

    def upDiagonal(token) #checking cells [2,0],[1,1],[0,2]
    	#r=@rows-1
    	r=@board.rows-1
    	0.upto(@board.rows-1) do |c|
    		if @board.grid[r][c].count(token)<1

    			return false
    		end
    		r-=1
    	end
    	puts "upward diagonal win"
    	return true
    end

    def tie
      if @numOfTurns<1
        puts "It's a draw!"
        return true
      else
        return false
      end
    end
     #another class
    def numOfTurns
      return @numOfTurns
    end

    def gameOver(cellNum,token)
        row=@board.getRowIndex(cellNum)
        col=@board.getColumnIndex(cellNum)
        if winByColumn(col,token) || winByRow(row,token) || winDiagonal(token)
          return true
        else
          return false
        end

    end

    def display
    	@board.display
    end
     

    def enterValue(cellNum,value)
    	if @board.enter(cellNum,value)
    		@numOfTurns-=1
    		return true
    	else
    		return false
    	end

    end

end