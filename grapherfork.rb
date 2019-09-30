#range = 400
#rangex = 1000
#trackline_height = 200 ## setting the equation to add by this value allows for "negative" points on the graph

class Position
    attr_accessor  :xdim, :ydim, :status, :char
def initialize(x, y, status)
    @xdim = x
    @ydim = y
    @status = status
    @char = " "
end

def maketrue
    @char = "X"
    @status = true
end

def makefalse
    @status = false
end

def makenil
    @status = nil
end

def makeline
    @char = "-"
    @status = true
end

def makeinput(input)
    @char = "#{input}"
    @status = true
end

end

class Input_set
    attr_accessor  :bigpointmode, :positionset, :xrange, :yrange, :trackline_height, :filename, :slopemode, :xstart, :ystart
    def initialize(positions, xrange, yrange, trackline_height = (xrange/2).to_i, xstep = 1, ystep = 1, xstart = 0, ystart = 0, filename ="graph", slopemode = false)
            @filename = filename
            @xrange = xrange + xstart
            @yrange = yrange + ystart
            @trackline_height = trackline_height
            @xstart = xstart
            @ystart = ystart
            if positions[0] == nil
                countx = xstart
                county = ystart
                count = 0

                    while county < yrange+ystart
                        positions[count] = Position.new((countx), (county), false)
                            countx+=xstep
                            if countx >= xrange +xstart
                                countx = 0
                                county +=ystep
                            end
                        count+=1
                    end
            end

            @slopemode = slopemode
            @positionset = []
            @positionset = positions
            @bigpointmode = false
    end
        def bigpointmode
            @bigpointmode = true
        end


        def graphit(filename = self.filename)

           # yield(50)


        def xeq(xdim)
            xdim
        end
    
    def yeq(ydim)
      ydim
    end

            @filename = filename
            count = 0
            str = "|"
            while count < self.positionset.length
                    if xeq(yield(self.positionset[count].xdim)) == yeq(self.positionset[count].ydim)
                        self.positionset[count].makeinput("#")
                    end 
                       if  self.trackline_height == self.positionset[count].ydim 
                        self.positionset[count].makeinput("-")
                    end  
                    str = str+self.positionset[count].char         # +str 
                if (count+@xstart) % (self.xrange) == 0   && count != 0
                    str =  str +"|\n|"            
                end
                    count+=1
            end
            
            
            strray = []
            strray = str.split("|")
            count = 0
            closedreverse = []
            while count < strray.length
                closedreverse << strray[count].reverse
                count +=1
            end
            str = ""
            count = 0
            while count < closedreverse.length
            str = str +closedreverse[count]
            count +=1
            end
            
            
            IO.write("#{self.filename}.txt", str.reverse) 

        end
end


#positions, xrange, yrange, trackline_height,  xstep, ystep, xstart, ystart, filename, slopemode)
#test_graph = Input_set.new([], 1400, 100, 50, 1, 1, 0,  0, "fileoutput", false)

#test_graph.graphit("thefilewilltakethisname") do |xdim|
 #   xdim =      (xdim * 0.0174533) #                      to convert radians to degrees (xdim*0.0174533)
 #   xdim =  (50+(30*Math.cos(Math.sin(xdim)))).to_i
  # xdim.to_i
   # xdim
#end

