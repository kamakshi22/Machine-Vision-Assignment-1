function normalizeImage = normalization(normalizeImage)

Red = normalizeImage(:,:,1);
Green = normalizeImage(:,:,2);
Blue = normalizeImage(:,:,3);

normalization = sqrt(Red.^2 + Green.^2 + Blue.^2);
normalization(~normalization) = 1/sqrt(3);

normalizeImage(:,:,1) = (normalizeImage(:,:,1))./normalization;
normalizeImage(:,:,2) = (normalizeImage(:,:,2))./normalization;
normalizeImage(:,:,3) = (normalizeImage(:,:,3))./normalization;