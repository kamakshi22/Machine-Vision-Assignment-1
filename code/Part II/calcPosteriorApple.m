function posteriorApple=  calcPosteriorApple(mixGaussEst1, curI, mixGaussEst2)
%let's define priors for whether the pixel is Apple or non Apple
priorApple = 0.3;
priorNonApple = 0.7;


[imY imX imZ] = size(curI);

posteriorSkin = zeros(imY,imX);
for (cY = 1:imY);
    fprintf('Processing Row %d\n',cY);
    for (cX = 1:imX);
        %extract this pixel data
        thisPixelData = squeeze(double(curI(cY,cX,:)));
        %calculate likelihood of this data given skin model
        %TO DO - fill in this routine (below)
        likeApple = mixGaussEst1.weight(1)*calcGaussianProb(thisPixelData,mixGaussEst1.mean(:,1),mixGaussEst1.cov(:,:,1))+ mixGaussEst1.weight(2)*calcGaussianProb(thisPixelData,mixGaussEst1.mean(:,2),mixGaussEst1.cov(:,:,2)) + mixGaussEst1.weight(3)*calcGaussianProb(thisPixelData,mixGaussEst1.mean(:,3),mixGaussEst1.cov(:,:,3));
        %calculate likelihood of this data given non skin model
        likeNonApple=mixGaussEst2.weight(1)*calcGaussianProb(thisPixelData,mixGaussEst2.mean(:,1),mixGaussEst2.cov(:,:,1))+ mixGaussEst2.weight(2)*calcGaussianProb(thisPixelData,mixGaussEst2.mean(:,2),mixGaussEst2.cov(:,:,2)) + mixGaussEst2.weight(3)*calcGaussianProb(thisPixelData,mixGaussEst2.mean(:,3),mixGaussEst2.cov(:,:,3));
        %TO DO (c):  calculate posterior probability from likelihoods and
        %priors using BAYES rule. Replace this:
        posteriorApple(cY,cX) = (likeApple* priorApple)/((likeApple* priorApple)+(likeNonApple* priorNonApple));
    end;
end;
%draw  posterior
clims = [0, 1];
figure;
imagesc(posteriorApple, clims); colormap(gray); axis off; axis image;
