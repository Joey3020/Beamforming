function [data, label] = DL_generate_data_by_class(datasize, lamda, num)
    data = zeros(datasize, num*num);
    label = zeros(datasize, 5);
    
    MAX_L = 30;
    MAX_d = 10;
    
    processbar = waitbar(0, 'processing output');

    
    for iter = 1:1:datasize
        a = randi([1, MAX_L]);
        b = randi([1, MAX_L]);
        x0 = a * rand;
        y0 = b * rand;
        d = randi([1, MAX_d]);
        
        [Exa, Eya, Hxa, Hya] = Aperture_field_from_point_source(x0, y0, d, a, b, lamda, num);
        D = Get_Directivity_General(Exa, Eya, Hxa, Hya, a, b, lamda, num);
        D = reshape(D, 1, []);
        
        
        plot_single_beam(D);
        
        data(iter, :) = D;
        label(iter, 1) = a;
        label(iter, 2) = b;
        label(iter, 3) = x0;
        label(iter, 4) = y0;
        label(iter, 5) = d;
        
        waitbar(iter / datasize)
    end
    
    close(processbar);

end