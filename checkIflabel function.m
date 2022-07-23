function[] = checkIflabel(b,grayImage)

x=[0 0 7 7];
logo1=rgb2gray(imread("logo1.jpeg"));
logo2=rgb2gray(imread("logo2.jpeg"));
logo3=rgb2gray(imread("logo3.jpeg"));
logo4=rgb2gray(imread("logo4.jpeg"));


b=imbinarize(b,0.3);
p1=circles(b);
[l ,num]=bwlabel(p1);

statsl=regionprops(l,'Area','Perimeter','BoundingBox');
 Mvalues = [ ];
 
logos=[]
 for R=1:num
    I2 = imcrop(grayImage,statsl(R).BoundingBox+x); 
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
    logos(R)=logoN;
    Mvalues(R)=m;
    %figure,imshow(I2);
 end
  
   m1 = max(Mvalues);
   index = find(Mvalues==m1);
   I2 = imcrop(grayImage,statsl(index).BoundingBox+x); 
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