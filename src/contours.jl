module contours;

include("preprocessing.jl");
include("seekAndFill.jl");
include("postprocessing.jl");

    function detectClosedContours(path)
        data = preprocessing.preprocessRGBImage(path);
        seekAndFill.processImage(data);
        return postprocessing.computeResult(data);
    end;      

end;
