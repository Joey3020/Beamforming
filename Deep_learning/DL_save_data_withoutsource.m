     
data_size = 10;
lamda = 1;
num = 64;

 [data, label] = DL_generate_test_data_withoutsource(data_size, lamda, num);
     
     
filename = 'C:\Users\joonho0320\Documents\testdata_without_source.xlsx';
writematrix(data, filename, 'Sheet', 1);
writematrix(label, filename, 'Sheet', 2);
%label
% a, b, x, y, d
%100 개 생성하는데 3:30초 정도 걸림
