include("preprocessing.jl");
include("seekAndFill.jl");
include("postprocessing.jl");

data = preprocessing.preprocessRGBImage("./img/4.png");
seekAndFill.processEdgePixel(data, 1, 1);
res = postprocessing.computeResult(data);
println("Result: $res");
