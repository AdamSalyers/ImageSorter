choice = menu('Please pick a menu Option:','1. Sort Images Based on Color','2. Sort Images Based on Size',...
    '3. Randomly Sort Images','4. Quit');
while choice ~= 4
    if choice == 1
        direct = 'C:\Users\Adam Salyers\Documents\MATLAB\NASA Image Processor\MyImages';
        Files = dir(fullfile(direct,'Image*.jpg'));
        for k = 1:numel(Files)
            F = fullfile(direct,Files(k).name);
            Imag = imread(F);
            %imshow(Imag);
            Files(k).data = Imag;
        end
        %Add code to compare Image color
        %Should end with a resorted array S that has the filenames
        choice1 = menu('Would you like too sort images based on a certain color?','1. Green','2. Red','3. Blue','4.No');
        ColorMatrix = zeros(2,numel(Files));
        if choice1 == 1
            fprintf('Sorting Based on Green');
            for gr = 1:numel(Files)
                [~,~,chan] = size(Files(gr).data);
                ColorMatrix(2,gr) = gr;
                if chan == 3
                    ColorMatrix(1,gr) = sum(sum(Files(gr).data(:,:,2)));
                else
                    ColorMatrix(1,gr) = sum(Files(gr).data(:));
                end
            end
        elseif choice1 == 2
            fprintf('Sorting Based on Red');
            for rr = 1:numel(Files)
                [~,~,chan] = size(Files(rr).data);
                ColorMatrix(2,rr) = rr;
                if chan == 3
                    ColorMatrix(1,rr) = sum(sum(Files(rr).data(:,:,1)));
                else
                    ColorMatrix(1,rr) = sum(Files(rr).data(:));
                end
            end
        elseif choice1 == 3
            fprintf('Sorting Based on Blue');
            for br = 1:numel(Files)
                [~,~,chan] = size(Files(br).data);
                ColorMatrix(2,br) = br;
                if chan == 3
                    ColorMatrix(1,br) = sum(sum(Files(br).data(:,:,3)));
                else
                    ColorMatrix(1,br) = sum(Files(br).data(:));
                end
            end
        else
            fprintf('Sorting Not Based on a Specific Color');
            for gr = 1:numel(Files)
                [~,~,chan] = size(Files(gr).data);
                ColorMatrix(2,gr) = gr;
                if chan == 3
                    grayim = rgb2gray(Files(gr).data);
                else
                    grayim = Files(gr).data;
                end
                ColorMatrix(1,gr) = sum(grayim(:));
            end
        end
        ColorMatrix = BubbleSort(ColorMatrix);
        for Cs = 1:numel(Files)
          temp = Files(Cs);
          Files(Cs) = Files(ColorMatrix(2,Cs));
          Files(ColorMatrix(2,Cs)) = temp;
        end
        mkdir MyImagesColor;
        for id = 1:numel(Files)
          imwrite(Files(id).data,sprintf('MyImagesColor/Image%d.jpg',id));
        end
    elseif choice == 2
        direct2 = 'C:\Users\Adam Salyers\Documents\MATLAB\NASA Image Processor\MyImages';
        Files2 = dir(fullfile(direct2,'Image*.jpg'));
        for j = 1:numel(Files2)
            F2 = fullfile(direct2,Files2(j).name);
            Imag2 = imread(F2);
            Files2(j).data = Imag2;
        end
        SizeMatrix = zeros(2,numel(Files2));
        for g = 1:numel(Files2)
            SizeMatrix(2,g) = g;
            [height, width, dim] = size(Files2(g).data);
            SizeMatrix(1, g) = height*width;
            %disp(SizeMatrix(1,g));
        end
        SizeMatrix = BubbleSort(SizeMatrix);
        for Lp = 1:numel(Files2)
          temp = Files2(Lp);
          Files2(Lp) = Files2(SizeMatrix(2,Lp));
          Files2(SizeMatrix(2,Lp)) = temp;
        end
        mkdir MyImagesSize;
        for i = 1:numel(Files2)
          %disp(Files2(i).name);
          imwrite(Files2(i).data,sprintf('MyImagesSize/Image%d.jpg',i));
        end
    elseif choice == 3
        direct3 = 'C:\Users\Adam Salyers\Documents\MATLAB\NASA Image Processor\MyImages';
        Files3 = dir(fullfile(direct3,'Image*.jpg'));
        for l = 1:numel(Files3)
            F3 = fullfile(direct3,Files3(l).name);
            Imag3 = imread(F3);
            Files3(l).data = Imag3;
        end
        for Pl = 1:numel(Files3)
          temp = Files3(Pl);
          Files3(Pl) = Files3(numel(Files3)-p+1);
          Files3(numel(Files3)-p+1) = temp;
        end
        mkdir MyImagesRand;
        for p = 1:numel(Files3)
          imwrite(Files3(p).data,sprintf('MyImagesRand/Image%d.jpg',p));
        end
    end
    choice = menu('Please pick a menu Option:','1. Sort Images Based on Color','2. Sort Images Based on Size',...
            '3. Randomly Sort Images','4. Quit');
end
        