function [curI, curImask] = ImagePixels(iImage)

if( ~exist('apples', 'dir') || ~exist('testApples', 'dir') )
    display('Please change current directory to the parent folder of both apples/ and testApples/');
end

% Note that cells are accessed using curly-brackets {} instead of parentheses ().
Iapples = cell(6,1);
Iapples{1} = '../../apples/Apples_by_kightp_Pat_Knight_flickr.jpg';
Iapples{2} = '../../apples/ApplesAndPears_by_srqpix_ClydeRobinson.jpg';
Iapples{3} = '../../apples/bobbing-for-apples.jpg';
Iapples{4} = '../../apples/Bbr98ad4z0A-ctgXo3gdwu8-original.jpg';
Iapples{5} = '../../apples/test_image_1.jpg';
Iapples{6} = '../../apples/test_image_2.jpg';


IapplesMasks = cell(6,1);
IapplesMasks{1} = '../../apple_mask/Apples_by_kightp_Pat_Knight_flickr.png';
IapplesMasks{2} = '../../apple_mask/ApplesAndPears_by_srqpix_ClydeRobinson.png';
IapplesMasks{3} = '../../apple_mask/bobbing-for-apples.png';
IapplesMasks{4} = '../../apple_mask/Bbr98ad4z0A-ctgXo3gdwu8-original.png';
IapplesMasks{5} = '../../apple_mask/test_image_1.png';
IapplesMasks{6} = '../../apple_mask/test_image_2.png';

% iImage = 1; % Could use this index to loop.

%Code for the normalizing with RGB components
%curI = normalization(double(imread(  Iapples{iImage}   )) );

curI = double(imread(  Iapples{iImage}   ))/255;

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

