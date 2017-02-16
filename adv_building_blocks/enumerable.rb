module Enumerable
   def my_each
   		for i in 0...self.length
   			yield(self[i])
   		end
   		self
   end

   def my_each_with_index
       for i in 0...self.length
       		yield(self[i],i)
       end
       self
   end

   def my_select
      return to_enum(:my_select) unless block_given?
   	  newArray=[]
   		for i in 0...self.length
   			if yield(self[i])
   				newArray.push(self[i])
   			end
   		end
   		newArray
   end
   
   def my_all?
     return false unless block_given?
   	  value=true
   		for i in 0...self.length
   			value = yield(self[i])
   			break if !value
   		end
   		value
   end

   def my_any?
   	value=false
   	if block_given?
	   		for i in 0...self.length
	   			value = yield(self[i])
	   		     break if value
	   		end
    else
      for i in 0...self.length
        return true if self[i]!=false &&!self[i].nil?
      end
    end
   		value
   end

   def my_none?
   		value=true
   		if block_given?
            for i in 0...self.length
            	if yield(self[i])
            		value=false
            	end
            end
      else 
        for i in 0...self.length
          return false if self[i]==true
        end

   		end

   		value
   end

   def my_count(*p)
   	   count=0
       if block_given?
       	 for i in 0...self.length
       	 	if yield(self[i])
       	 		 count+=1
       	 	end
       	 end
       

       else
          if p.length==0
          	count=self.length
          else
          	for i in 0...self.length
          		if self[i]==p[0]
          			count+=1
          		end
          	end
          end
       end
       count
   end



   def my_map
   		arr=[]
   		if block_given?
   			for i in 0...self.length
   				arr.push(yield(self[i]))
   			end
   		else
   		   arr=self
   		end
   		arr
   end



end

