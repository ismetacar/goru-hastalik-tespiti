srcFiles = dir('C:\Users\ismetacar\Downloads\db-2015-05-07\whitebalanced-images\*.jpg');  % the folder in which ur images exists
for i = 1 : length(srcFiles)
    filename = strcat('C:\Users\ismetacar\Downloads\db-2015-05-07\whitebalanced-images\',srcFiles(i).name);
    imageData = imread(filename);
    imageData = imcrop(imageData, [450 250 3330 2330]);   %Otomatik crop;
    FDetect = vision.CascadeObjectDetector;
    
    imageDataOriginal = imageData;          %resmin orijinali de dursun;
    
    BB = step(FDetect, imageData);   %kýrmýzý þeritler için BB matrisi oluþtur. (Nerede baþlayýp nerede biteceðini söylemek)
    
    for j=1:size(BB,1)
        face = imcrop(imageData, BB(j,:));
        
    end
    imwrite(face, ['C:\Users\ismetacar\Downloads\db-2015-05-07\facecropped-images\.jpg', num2str(i), '.jpg']);
%     figure, imshow(imageData); hold on   %görüntülenen resim üzerinde ....
%     for i = 1:size(BB,1)
%         rectangle('Position',BB(i,:),'LineWidth',5,'LineStyle','-','EdgeColor','r');    %bu iþi yap. Kýrmýzý Kare çiz.
%     end
%     title('Face Detection');
%     hold off; 
%    if size(BB, 1) == 1
%        face = imcrop(imageDataOriginal, [BB(1,1), BB(1,2), BB(1,3), BB(1,4)]); %büyük olaný crop et ve farklý bir figure olarak göster
%        imwrite(face, ['C:\Users\ismetacar\Downloads\db-2015-05-07\facecropped-images\.jpg', num2str(i), '.jpg']);
%    elseif BB(2,3) > 100
%        face = imcrop(imageDataOriginal, [BB(2,1), BB(2,2), BB(2,3), BB(2,4)]); %büyük olaný crop et ve farklý bir figure olarak göster
%        imwrite(face, ['C:\Users\ismetacar\Downloads\db-2015-05-07\facecropped-images\.jpg', num2str(i), '.jpg']);
%    elseif BB(3,3) > 100
%        face = imcrop(imageDataOriginal, [BB(3,1), BB(3,2), BB(3,3), BB(3,4)]); %büyük olaný crop et ve farklý bir figure olarak göster
%        imwrite(face, ['C:\Users\ismetacar\Downloads\db-2015-05-07\facecropped-images\.jpg', num2str(i), '.jpg']);
%    elseif BB(4,3) > 100
%        face = imcrop(imageDataOriginal, [BB(4,1), BB(4,2), BB(4,3), BB(4,4)]); %büyük olaný crop et ve farklý bir figure olarak göster
%        imwrite(face, ['C:\Users\ismetacar\Downloads\db-2015-05-07\facecropped-images\.jpg', num2str(i), '.jpg']);
%    end
%    if size(BB, 1) == 2             %BB matrisinin satýr sayýsý 2 ise, yani iki yüz algýlanmýþ ise...
%        if BB(1,3) > BB(2, 3) & BB(1,3) > 200
%            face = imcrop(imageDataOriginal, [BB(1,1), BB(1,2), BB(1,3), BB(1,4)]); %büyük olaný crop et ve farklý bir figure olarak göster
%            imwrite(imageData, ['C:\Users\ismetacar\Downloads\db-2015-05-07\facecropped-images\.jpg', num2str(i), '.jpg']);
%            
%        else
%            face = imcrop(imageDataOriginal, [BB(2,1), BB(2,2), BB(2,3), BB(2,4)]);
%            imwrite(imageData, ['C:\Users\ismetacar\Downloads\db-2015-05-07\facecropped-images\.jpg', num2str(i), '.jpg']);
%        end
%    
%    elseif size(BB, 1) == 3  % 3 tane yüz var ise...
%        if BB(1,3) > BB(2,3) & BB(1, 3) > BB(3,3)
%            face = imcrop(imageDataOriginal, [BB(1,1), BB(1,2), BB(1,3), BB(1,4)]);
%            imwrite(imageData, ['C:\Users\ismetacar\Downloads\db-2015-05-07\facecropped-images\.jpg', num2str(i), '.jpg']);
%        elseif BB(2, 3) > BB(1, 3) & BB(2, 3) > BB(3,3)
%            face = imcrop(imageDataOriginal, [BB(2,1), BB(2,2), BB(2,3), BB(2,4)]); 
%            imwrite(imageData, ['C:\Users\ismetacar\Downloads\db-2015-05-07\facecropped-images\.jpg', num2str(i), '.jpg']);
%        elseif BB(3, 3) > BB(1,3) & BB(3,3) > BB(2,3)
%            face = imcrop(imageDataOriginal, [BB(3,1), BB(3,2), BB(3,3), BB(3,4)]);
%            imwrite(imageData, ['C:\Users\ismetacar\Downloads\db-2015-05-07\facecropped-images\.jpg', num2str(i), '.jpg']);
%        end
%    end
end