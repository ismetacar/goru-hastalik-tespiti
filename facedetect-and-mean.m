srcFiles = dir('C:\Users\ismetacar\Downloads\db-2015-05-07\facecropped-images\*.jpg');
for i = 1 : length(srcFiles)
    filename = strcat('C:\Users\ismetacar\Downloads\db-2015-05-07\facecropped-images\',srcFiles(i).name);
    CI = imread(filename);
    for i=1:size(CI,1)
        for k=1:size(CI,2)
            if (CI(i,k,1)>40 && CI(i,k,1)<150) && (CI(i,k,2)>120 && CI(i,k,2)<230) && (CI(i,k,3)>60 && CI(i,k,3)<170)
                CI(i,k,1)=5;
                CI(i,k,2)=5;
                CI(i,k,3)=5;
            end
        end
    end
    % figure(4), imshow(CI);
    I = CI;
    GI = rgb2gray(CI);
    GIE = (GI> 120 & GI< 170);
    GIE = im2bw(GIE);
    %imshow(GIE);
    sayac = 0;
    toplamR = 0;
    toplamG = 0;
    toplamB = 0;
    for i=1:size(GIE,1)
        for k=1:size(GIE,2)
            if GIE(i,k) == 0;
                CI (i,k,1) = 5;
                CI (i,k,2) = 5;
                CI (i,k,3) = 5;
            else
                toplamR = im2double(CI (i,k,1)) + toplamR;
                toplamG = im2double(CI (i,k,2)) + toplamG;
                toplamB = im2double(CI (i,k,3)) + toplamB;
                sayac = sayac + 1;
                continue;
            end
        end
    end
    oR = toplamR / sayac;
    oG = toplamG / sayac;
    oB = toplamB / sayac;
    
    oRenk(1,1,1) = oR;
    oRenk(1,1,2) = oG;
    oRenk(1,1,3) = oB;
    oRenk = im2uint8(oRenk);

    oRenkS = (imresize(oRenk, [200 200]));
    
    imwrite(CI, ['C:\Users\ismetacar\Downloads\db-2015-05-07\nosedetect-images\.jpg', num2str(i), '.jpg']);
end
