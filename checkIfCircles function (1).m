function[] = checkIfcircle(grayImage)


logo1=rgb2gray(imread("logo1.jpeg"));
logo2=rgb2gray(imread("logo2.jpeg"));
logo3=rgb2gray(imread("logo3.jpeg"));
logo4=rgb2gray(imread("logo4.jpeg"));

gauss = imgaussfilt(grayImage,1);
figure, imshow(gauss);
sobel = edge(gauss,'sobel');
figure, imshow(sobel);
se = strel ('square',4);
morph = imdilate(sobel,se);
figure, imshow(morph);

[centers, radii] = imfindcircles(morph,[3 10]);
centersStrong = centers(1:1,:); 
radiiStrong = radii(1:1)
viscircles(centersStrong , radiiStrong ,'Color','b');
x = [centersStrong(1)-10 centersStrong(2)-10 45 20];
I2 = imcrop(grayImage,x); 



 Mvalues = [ ];
 logos=[]

    [l w] = size(logo1);
    RGB2 = imresize(I2,[l w]);
    [values(1) ,ssimMap1] = ssim(RGB2,logo1);
    [l w] = size(logo2);
    RGB2 = imresize(I2,[l w]);
    [values(2),ssimMap2] = ssim(RGB2,logo2);
    [l w] = size(logo3);
    RGB2 = imresize(I2,[l w]);
    [values(3),ssimMap3] = ssim(RGB2,logo3);
    [l w] = size(logo4);
    RGB2 = imresize(I2,[l w]);
    [values(4),ssimMap4] = ssim(RGB2,logo4);
    
    m = max(values);
    logoN = find(values==m);
    logos(1)=logoN;
     Mvalues(1)=m;
  

  
   m1 = max(Mvalues);
   index = find(Mvalues==m1);
   if(logos(index)==1)
   figure, imshow(I2),title("opel");
   end
   if(logos(index)==2)
   figure, imshow(I2),title("KIA");
   end
   if(logos(index)==3)
   figure, imshow(I2),title("Hyundai");
   end
   if(logos(index)==4)
   figure, imshow(I2),title("Hyundai");
   end

end