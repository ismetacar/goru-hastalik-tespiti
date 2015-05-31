srcFiles = dir('C:\Users\ismetacar\Downloads\db-2015-05-07\whitebalanced-images\*.jpg');
for i = 1 : length(srcFiles)
    filename = strcat('C:\Users\ismetacar\Downloads\db-2015-05-07\whitebalanced-images\',srcFiles(i).name);
    imageData = imread(filename);
    [m n k]=size(imageData); 
    I=reshape(imageData,m*n,3); 
    Rmean=(sum(I(:,1)))/(m*n); 
    Gmean=(sum(I(:,2)))/(m*n); 
    Bmean=(sum(I(:,3)))/(m*n); 
    %M = [Rmean; Gmean; Bmean];
    %dlmwrite('C:\Users\ismetacar\Downloads\db-2015-05-07\rgbmeans.txt', M, '-append')
    %dlmwrite('C:\Users\ismetacar\Downloads\db-2015-05-07\rgbmeans.txt', M,'-append', 'delimiter','\n','roffset',1);
    
    dlmwrite('C:\Users\ismetacar\Downloads\db-2015-05-07\rgbmeans.txt', num2str(i), '-append', 'delimiter', ' ', 'newline', 'pc');
    dlmwrite('C:\Users\ismetacar\Downloads\db-2015-05-07\rgbmeans.txt', ' ', '-append', 'delimiter', ' ', 'newline', 'pc');
    
    dlmwrite('C:\Users\ismetacar\Downloads\db-2015-05-07\rgbmeans.txt', Rmean, '-append', 'delimiter', ' ', 'newline', 'pc');
    dlmwrite('C:\Users\ismetacar\Downloads\db-2015-05-07\rgbmeans.txt', Gmean, '-append', 'delimiter', ' ', 'newline', 'pc');
    dlmwrite('C:\Users\ismetacar\Downloads\db-2015-05-07\rgbmeans.txt', Bmean, '-append', 'delimiter', ' ', 'newline', 'pc');

    dlmwrite('C:\Users\ismetacar\Downloads\db-2015-05-07\rgbmeans.txt', '-------', '-append', 'delimiter', ' ', 'newline', 'pc');
end