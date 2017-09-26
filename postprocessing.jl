module postprocessing;

    function view(data)
        y, x = size(data);
        for i = 1:y
            for j = 1:x
                print(string(data[i, j]) *  " ");
            end;
            println("");
        end;
    end;

    function computeResult(data)
        y, x = size(data);
        
        for i = 1:y, j = 1:x
            data[i, j] && return true;
        end;
        return false;
        
    end;
end;