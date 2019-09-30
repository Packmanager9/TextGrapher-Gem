require "TextGrapher"
graph = Input_set.new([], 1400, 100, 50, 1, 1, 0,  0, "testgraphfile")

graph.graphit("testoutput") do |xdim|
    xdim =      (xdim * 0.0174533) #                      to convert radians to degrees (xdim*0.0174533)
    xdim =  (50+(30*Math.cos(Math.sin(xdim)))).to_i
    xdim.to_i
    xdim
end

