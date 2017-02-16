class Player
	 @@tokenX=true
   	 @@tokenO=true
   	 
   	   def initialize(name)
   	   		@name=name
   	   		if @@tokenX
               @token="X"
               @@tokenX=false
            else
           	   @token="O"
           	end
   	   end

   	   def token
   	   		return @token
   	   end
   	   def name
   	   	    return @name
   	   end

end