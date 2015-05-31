% fonksiyon whiteBalance(img, img); �eklinde �a��r�lacak.
% birinci parametre olan img whitebalance'a tabii tutulacak, di�eri ile
% ilgili i�lem yap�lmayacak. Fonksiyon �al��t�r�lmadan �nce img de�erleri
% imread ile yerelden okunan resimler olacak. Fonsiyon sonunda iki farkl�
% figure penceresi a��l�r ve whitebalance'a tabii tutulduktan sonraki hali
% ile orjinal resim g�r�nt�lenir.
srcFiles = dir('C:\Users\ismetacar\Downloads\db-2015-05-07\y�z1\*.jpg');  % the folder in which ur images exists
for i = 1 : length(srcFiles)
    filename = strcat('C:\Users\ismetacar\Downloads\db-2015-05-07\y�z1\',srcFiles(i).name);
    imageData = imread(filename);
   imageDataOriginal = imageData;
   imageData = imcrop(imageData, [450 250 3330 2330]);
   pageSize = size(imageData,1) * size(imageData,2);
   avg_rgb = mean( reshape(imageData, [pageSize,3]) );
   avg_all = mean(avg_rgb);
   scaleArray = max(avg_all, 128)./avg_rgb;
   scaleArray = reshape(scaleArray,1,1,3);
   adjustedImage = uint8(bsxfun(@times,double(imageData),scaleArray));
%    figure, imshow(adjustedImage);
%    figure, imshow(imageDataOriginal);
   %pathname = 'C:\Users\ismetacar\Downloads\db-2015-05-07\y�z\';
   %imwrite(imageData, 'C:\Users\ismetacar\Downloads\db-2015-05-07\y�z\.jpg');
   imwrite(imageData, ['C:\Users\ismetacar\Downloads\db-2015-05-07\whitebalanced-images\.jpg', num2str(i), '.jpg']);
end