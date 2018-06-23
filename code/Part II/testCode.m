function a = apples

% This code is for testing the apple images with RGB normalizaztion


clear all;
close all;

if( ~exist('apples', 'dir') || ~exist('testApples', 'dir') )
    display('Please change current directory to the parent folder of both apples/ and testApples/');
end

% Note that cells are accessed using curly-brackets {} instead of parentheses ().
Iapples = cell(3,1);
Iapples{1} = '../../apples/test_image_1.jpg';

IapplesMasks = cell(3,1);
IapplesMasks{1} = '../../apple_mask/test_image_1.png';


iImage = 1; % Could use this index to loop.
curI = normalization(double(imread(  Iapples{iImage} )));
% curI is now a double-precision 3D matrix of size (width x height x 3).
% Each of the 3 color channels is now in the range [0.0, 1.0].
figure;
imagesc(curI)


curImask = imread(  IapplesMasks{iImage}   );
% These mask-images are often 3-channel, and contain grayscale values. We
% would prefer 1-channel and just binary:
curImask = curImask(:,:,2) > 128;  % Picked green-channel arbitrarily.
figure;
imshow(curImask)
% Extracting Apple Plixels and Non Apples Pixels
ApplePixels= curI .* curImask;
NonApplePixels = curI .* ~curImask;
figure;
imagesc( NonApplePixels)

AppleData = RemoveRedundantPixels(ApplePixels);
NonAppleData= RemoveRedundantPixels(NonApplePixels);

nGaussEst=3;
% mixGaussEst3 = fitMixGauss(AppleData,nGaussEst);
% mixGaussEst4 = fitMixGauss(NonAppleData,nGaussEst);
load('data/cross23train');

%curI = normalization(double(imread(  'testApples/audioworm-QKUJj2wmxuI-original.jpg'   )));
%cur2 = normalization(double(imread(  'testApples/app2.jpg'   )));
%cur3 = normalization(double(imread(  'testApples/app1.jpg'   )));
%  cur6 = normalization(double(imread(  'testApples/test_image_1.jpg'   )));
% curI is now a double-precision 3D matrix of size (width x height x 3).
% Each of the 3 color channels is now in the range [0.0, 1.0].
figure;
imagesc(curI)

%-----------------
% curImask = imread(  'testApples/Bbr98ad4z0A-ctgXo3gdwu8-original.png'   );
% % These mask-images are often 3-channel, and contain grayscale values. We
% % would prefer 1-channel and just binary:
% curImask = curImask(:,:,2) > 128;  % Picked green-channel arbitrarily.
% figure;
% imshow(curImask)
%-------------------


%posteriorApple =  calcPosteriorApple(mixGaussEst3, curI, mixGaussEst4);
% posteriorApple =  calcPosteriorApple(mixGaussEst3, cur2, mixGaussEst4);
% posteriorApple =  calcPosteriorApple(mixGaussEst3, cur3, mixGaussEst4);
% posteriorApple =  calcPosteriorApple(mixGaussEst1, curI, mixGaussEst2);
posteriorApple5 =  calcPosteriorApple(mixGaussEst3, curI, mixGaussEst4);
 RocCurve(curImask, posteriorApple5);









