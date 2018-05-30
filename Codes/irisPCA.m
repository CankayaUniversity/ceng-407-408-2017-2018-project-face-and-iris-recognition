function [resultImage]=irisPCA(datapath,testimg)


E = dir(datapath);  
imageCounter = 0;
for i=1 : size(E,1)
    if not(strcmp(E(i).name,'.')|strcmp(E(i).name,'..')|strcmp(E(i).name,'Thumbs.db'))
        imageCounter = imageCounter + 1; % Number of all images in the training database
    end
end

%create image matrix
Y = [];
for i = 1 : imageCounter 
    string1 = strcat(datapath,'\',int2str(i),'.jpg');
    img = imread(string1);
    %img = rgb2gray(img);
    [r c] = size(img);
    temp = reshape(img',r*c,1);  % 2D to 1D
                              
                            
    Y = [Y temp];               
end

% eigF

m = mean(Y,2);
imageCounter = size(Y,2);



M = [];
for i=1 : imageCounter
    temp = double(Y(:,i)) - m;
    M = [M temp];
end

L= M' * M;
[V,E]=eig(L);  

eigenVec = [];
for i = 1 : size(V,2) 
    if( E(i,i) > 1 )
        eigenVec = [eigenVec V(:,i)];
    end
end


eigF = M * eigenVec;



pImage = [ ];  
for i = 1 : size(eigF,2)
    temp = eigF' * M(:,i);
    pImage = [pImage temp];
end


givenImage = imread(testimg);
givenImage = givenImage(:,:,1);
[r c] = size(givenImage);
temp = reshape(givenImage',r*c,1);
size(m)
size(temp)
temp = double(temp)-m; 
pGivenImage = eigF'*temp; 

euclide_dist = [ ];
for i=1 : size(eigF,2)
    temp = (norm(pGivenImage-pImage(:,i)))^2;
    euclide_dist = [euclide_dist temp];
end
[euclide_dist_min locationFound] = min(euclide_dist);
resultImage = strcat(int2str(locationFound),'.jpg');