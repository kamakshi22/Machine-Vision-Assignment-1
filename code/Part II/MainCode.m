function a = MainCode

%This code is for training the model with Mixture of Gaussian
% and testing at the bottom part of the code

clear all;
close all;

% Extracting Apple Plixels and Non Apples Pixels
[cur1,curImask1]= ImagePixels(1);

ApplePixels= cur1 .* curImask1;
NonApplePixels = cur1 .* ~curImask1;
figure;
imagesc( NonApplePixels)

AppleData = RemoveRedundantPixels(ApplePixels);
NonAppleData= RemoveRedundantPixels(NonApplePixels);

nGaussEst=3;
mixGaussEst1 = fitMixGauss(AppleData,nGaussEst);
mixGaussEst2 = fitMixGauss(NonAppleData,nGaussEst);

%Load pre-saved train params
%load('data/image1train');

% posteriorApple =  calcPosteriorApple(mixGaussEst1, cur1, mixGaussEst2);


% for testing :
[cur4 curImask4]= ImagePixels(4);
[cur5 curImask5]= ImagePixels(5);
[cur6 curImask6]= ImagePixels(6);

posteriorAppleTest4 =  calcPosteriorApple(mixGaussEst1, cur4, mixGaussEst2);
RocCurve(curI, posteriorApple); % For The first image
posteriorAppleTest5 =  calcPosteriorApple(mixGaussEst1, cur5, mixGaussEst2);
posteriorAppleTest6 =  calcPosteriorApple(mixGaussEst1, cur6, mixGaussEst2);

RocCurve(curImask4, posteriorAppleTest4);
RocCurve(curImask5, posteriorAppleTest5);
RocCurve(curImask6, posteriorAppleTest6);










