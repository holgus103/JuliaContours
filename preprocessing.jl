module preprocessing;
using FileIO;
using FixedPointNumbers;

    function preprocessRGBImage(path)
        img = load(path);
        h, w = size(img);
        data = Array{Bool}(h,w);
        z = Normed{UInt8, 8}(0); 
        for j = 1:h
            for i = 1:w
                c = img[j, i];
                if(c.r == z && c.g == z && c.b == z)
                    data[j,i] = false;
                else
                    data[j,i] = true;
                end;
            end;
        end;
    return data;
    end;

    #TODO more formats
end;