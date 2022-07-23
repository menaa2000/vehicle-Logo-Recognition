%%%%%%%%%%%%%%%%%%%%%%%%
close all %to closs all figures each time
clc
original=imread('case4.jpg');
[f g]=size(original);

%canny for using edge-based segmentation
grayImage = rgb2gray(original);
canny = edge(grayImage,'canny');

%using hough to connect lines
res = h(canny);

%removing objects less than 200 pixels
res = bwareaopen(res,200,26);

%use dilation & hough transform to link the edges
st=strel('square',5);
 res=imdilate(res,st);
res=h(res);

%we remove small objects
res = bwmorph(res,'clean',inf);
res=h(res);
[L, num] = bwlabel(res);
RGB = label2rgb(L);
res = bwareaopen(res,15000,4);
%------------------------------------------------------------
filled=imfill(res,'holes');

st=strel('square',15);
filled=imdilate(filled,st);
filled=imfill(filled,'holes');

st=strel('square',30);
filled=imerode(filled,st);
res = bwareaopen(filled,15000,4);
st=strel('disk',29);
afterdil=imdilate(res,st);

%To add afterdil to the gray scale image we must convert it to uint8
uintImage = uint8(255 * afterdil);
white_car=uint8(grayImage +uintImage);
comp=255-white_car;
gray_car=uint8(grayImage +comp);

pout_imadjust = imadjust(gray_car);

checkIfcircles(pout_imadjust);
checkIflabel(pout_imadjust,grayImage);



