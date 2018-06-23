
function pixel = RemoveRedundantPixels(pixels)
pixel = [];
[row col depth] = size(pixels);
for (i= 1: row)
    for (j= 1:col)
        if (pixels(i,j,1)~=0 && pixels(i,j,2)~=0 && pixels(i,j,3)~=0)
            pixel = [pixel, [pixels(i,j,1);pixels(i,j,2);pixels(i,j,3)]];
        end;
    end;
end;
