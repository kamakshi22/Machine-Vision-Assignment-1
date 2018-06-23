function validate= crossValidation()
clear all;
close all;

nGaussEst= 3;
[ApplePixelsTrainData NonApplePixelsTrainData curtest curImasktest]= crossFold(2,3,1);

mixGaussEst3 = fitMixGauss(ApplePixelsTrainData,nGaussEst);
mixGaussEst4 = fitMixGauss(NonApplePixelsTrainData,nGaussEst);

%Load the trained mat file
%load('data/crossv1train');
posteriorApple1 =  calcPosteriorApple(mixGaussEst3, curtest, mixGaussEst4);

function [ApplePixelsTrainData NonApplePixelsTrainData curtest curImasktest] = crossFold(train1,train2, test)

[curtrain1,curImasktrain1]=ImagePixels(train1);
[curtrain2,curImasktrain2]=ImagePixels(train2);
[curtest,curImasktest]=ImagePixels(test);

ApplePixels1= curtrain1 .* curImasktrain1;
NonApplePixels1 = curtrain1 .* ~curImasktrain1;
figure;
imagesc( NonApplePixels1)

ApplePixels2= curtrain2 .* curImasktrain2;
NonApplePixels2 = curtrain2 .* ~curImasktrain2;
figure;
imagesc( NonApplePixels2)

ApplePixelsTest= curtest .* curImasktest;
NonApplePixelsTest = curtest .* ~curImasktest;
figure;
imagesc( NonApplePixelsTest)


AppleDataTrain1 = RemoveRedundantPixels(ApplePixels1);
NonAppleDataTrain1= RemoveRedundantPixels(NonApplePixels1);
AppleDataTrain2 = RemoveRedundantPixels(ApplePixels2);
NonAppleDataTrain2= RemoveRedundantPixels(NonApplePixels2);

ApplePixelsTrainData= [AppleDataTrain1, AppleDataTrain2];
NonApplePixelsTrainData= [NonAppleDataTrain1, NonAppleDataTrain2];

%trainData= [ApplePixelsTrain , NonApplePixelsTrain];
%testdata= [curtest,curImasktest];




