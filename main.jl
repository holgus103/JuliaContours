using FileIO;

img = load("./img/2.png");
h, w = size(img);
data = Array{Bool}(h,w); 
for j = 1:h
    for i = 1:w
        c = img[j, i];
        if(c.r == 0 && c.g == 0 && c.b == 0)
            data[j,i] = false;
        else
            data[j,i] = true;
        end
    end
end