class Cell
    attr_reader :row, :column
    attr_accessor :occupied, :value
    
    def initialize(row,column,occupied=false,value="")
        @row=row
        @column=column
        @occupied=occupied
        @value=value
    end
    
    
  end