module seekAndFill;
using DataStructures;

    function processEdgePixel(data, h, w)
        function enqueuePixel(data, q, y, x)
            if(data[y,x])
                 enqueue!(q, (y, x));
            #     println("enqueued $y $x");
            end
        end;
        sizeY, sizeX = size(data);
        #println(" $sizeY $sizeX");
        if(data[h, w] == false)
            return;
        else
            q = Queue(Tuple{Int, Int});
            enqueue!(q, (h, w))
            i = 0;
            # process neighbours
            while !isempty(q)
                y, x = dequeue!(q);
                # println("dequeued $y $x");
                # if pixel was already processed, move on
                !data[y, x] && continue;

                data[y, x] = false;

                # assuming 0, 0 is the NW edge of the screen
                #    println("1");
                # add N neighbour
                y > 1 && enqueuePixel(data, q, y - 1, x);

                #    println("2");
                # add NE neighbour
                y > 1 && x < sizeX && enqueuePixel(data, q, y - 1, x + 1);

                #    println("3");
                # add E neighbour
                x < sizeX && enqueuePixel(data, q, y, x + 1);

                #    println("4");
                # add SE neighbour
                x < sizeX && y < sizeY && enqueuePixel(data, q, y + 1, x + 1);

                #    println("5");
                # add S neighbour
                y < sizeY && enqueuePixel(data, q, y + 1, x);

                #    println("6");
                # add SW neighbour
                y < sizeY && x > 1 && enqueuePixel(data, q, y + 1, x - 1);

                #    println("7");
                # add W neighbour
                x > 1 && enqueuePixel(data, q, y, x - 1);
                
                #    println("1");
                # add NW neighbour
                y > 1 && x > 1 && enqueuePixel(data, q, y - 1, x - 1);
                
                i+=1;
            end;
        end;
    end;

    function processImage(data)
        sizeY, sizeX = size(data);

        # whole upped and loweredge
        for i = 1:sizeX - 1
            processEdgePixel(data, 1, i);
            processEdgePixel(data, sizeY, i + 1);
        end
        # remaining sides
        for i = 1:sizeY - 1
            processEdgePixel(data, i + 1, 1);
            processEdgePixel(data, i, sizeX);
        end;

    end;
end;