module seekAndFill;
using DataStructures;

    function processEdgePixel(data, h, w)
        enqueuePixel(data, q, y, x) = data[y,x] && enqueue!(q, (y, x));
        sizeY, sizeX = size(data);
        if(data[h, w] == false)
            return;
        else
            q = Queue(Tuple{Int, Int});
            enqueue!(q, (h, w))
            # process neighbours
            while !isempty(q)
                y, x = dequeue!(q);
                # process pixed and add neighbours
                data[y,x] = false;
                print("set $y $x to false");
                y > 1 && x > 1 && enqueuePixel(data, q, h - 1, w - 1);
                y > 1 && enqueuePixel(data, q, h - 1, w);
                y < sizeY && enqueuePixel(data, q, h + 1, w);
                y > 1 && x < sizeX && enqueuePixel(data, q, h - 1, w + 1);
                x > 1 && enqueuePixel(data, q, h, w - 1);
                x < sizeX && enqueuePixel(data, q, h, w + 1);
                y < sizeY && x > 1 && enqueuePixel(data, q, h + 1, w - 1);
                x < sizeY && x < sizeX && enqueuePixel(data, q, h + 1, w + 1);
            end;
        end;
    end;
end;