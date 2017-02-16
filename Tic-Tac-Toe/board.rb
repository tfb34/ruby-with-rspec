
   require "./cell"
   
   class Board
    #can display, enter, retrieve
    attr_reader :rows, :columns, :grid
    def initialize(rows=3,columns=3)
    	@rows=rows
    	@columns=columns

    	@grid=Array.new(rows){Array.new(columns,"")}
    	@cellHash=Hash.new
    	
        create 
        assignCells
    end
    
    public
    def display
    	for r in 0...@rows
    		for c in 0...@columns
    			print @grid[r][c]
            end
    		print "\n"
    	end
    end

    def displayCells
        cellNum=1
        for r in 0...@rows
            for c in 0...@columns
                print cellNum.to_s+" "
                cellNum+=1
            end
            
            print "\n"
        end
    end
   
    def enter(cellNum,value)

      if @cellHash.key? cellNum
    	row=@cellHash[cellNum].row  
    	col=@cellHash[cellNum].column
    	if occupied(cellNum)
    		puts "cell#{cellNum} is already occupied"
            return false
        else
        	if @grid[row][col].count("_")>0
        		@grid[row][col].sub!("_",value.to_s)
        	else
        		@grid[row][col].sub!(" ",value.to_s)
        	end
        	@cellHash[cellNum].occupied=true#[coord,coord,true/false]
            @cellHash[cellNum].value=value
        	#@numOfTurns-=1  IMPORTANT 
        end
        return true
      else
      	puts "Not valid"
    	return false
      end
    end

    def getValue(cellNum)
        return @cellHash[cellNum].value
    end
    #keep
    def getRowIndex(cellNum)
    	return @cellHash[cellNum].row
    end
    #keep
    def getColumnIndex(cellNum)
    	return @cellHash[cellNum].column
    end
    
    def occupied(cellNum)#use either the cells
        if @cellHash[cellNum].occupied 
            return true
        else
            return false
        end
    end

    private

    def create
    	for r in 0...@rows-1 
    		for c in 0...@columns
    			#block
    			@grid[r][c]+="_"
                #block
    		end
    	end

    	for r in 0...@rows
    		for c in 0...@columns-1
    			#block
    			if @grid[r][c]=="_"
    			  @grid[r][c]+="|"
    			else
    				@grid[r][c]+=" |"
    			end
    			#block
    		end	
    	end

    	@grid[@rows-1][@columns-1]+=" "
    end
  
    def assignCells
    	cell=1
    	for r in 0..@rows-1
    		for c in 0..@columns-1
    			#@cellHash[cell]=[r,c,false]
                @cellHash[cell]=Cell.new(r,c)
    			cell+=1	
    		end
    	end
    	
    end
  
    
  end

