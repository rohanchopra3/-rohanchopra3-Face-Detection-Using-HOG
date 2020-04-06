function ori_histo = build_histogram(grad_mag, grad_ang, cell_size)
m = size(grad_mag,1);
n = size(grad_mag,2);

M = floor(m/cell_size);
N = floor(n/cell_size);

row = 1;
column = 1;
im(1:M,1:N,1:6) = 0;

for i = 1:M
    column = 1;
    for j = 1:N
        for r = row: row + (cell_size-1)
            for c = column : column+(cell_size-1)
                angle = grad_ang(r,c);
                
                if 165 < angle &&  angle <= 180
                    im(i,j,1) = im(i,j,1) + grad_mag(r,c);
                elseif 0 < angle &&  angle <= 15
                    im(i,j,1) = im(i,j,1)+ grad_mag(r,c);
                elseif 15 < angle &&  angle <= 45
                    im(i,j,2) = im(i,j,2)+ grad_mag(r,c);
                elseif 45 < angle &&  angle <= 75
                    im(i,j,3) = im(i,j,3) + grad_mag(r,c);
                elseif 75 < angle &&  angle <= 105 
                    im(i,j,4) =  im(i,j,4) + grad_mag(r,c);
                elseif 105 < angle &&  angle <= 135 
                    im(i,j,5) = im(i,j,5)+ grad_mag(r,c);
                elseif 135 < angle &&  angle <= 165
                    im(i,j,6) = im(i,j,6)+ grad_mag(r,c);
                end
            end
        end
        column = column + cell_size;
    end
    row = row+ cell_size ;
end

ori_histo = im;

end