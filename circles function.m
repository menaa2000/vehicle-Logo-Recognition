function [process ] = circles(x)

% x = imbinarize(x);
%figure, imshow(ms),title('orginal image');
[f g]=size(x);
process=zeros(f,g);
[l ,num]=bwlabel(x);
statsl=regionprops(x,'Area','Perimeter','BoundingBox','EulerNumber');

for R=1:num
    curr=(4*pi*statsl(R).Area)/(statsl(R).Perimeter^2);
   
     if ((curr<=0.36 && curr>= 0.25) && statsl(R).EulerNumber<1)
        disp("Param "+statsl(R).Perimeter+ "R "+ R);
         process=process+(l==R);
         disp("circ "+curr+ "R" + R);
          rectangle('Position',statsl(R).BoundingBox,'edgecolor','b','LineWidth',2);

     end
end

%
   
% % % % % % % % % % %&& (statsl(R).Area<=10000)
%&& (statsl(R).Area<=700 && statsl(R).Area>=50)
%imshow(process),title('image filled circular');