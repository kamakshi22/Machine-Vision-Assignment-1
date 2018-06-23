function curve= RocCurve(curImask, posteriorApple)
[row3 col3]= size(curImask)
TPR=[];
FPR= [];

for (f= 0:0.05:1 )
    TruePositive=0;
    FalseNegative=0;
    TrueNegative=0;
    FalsePositive=0;
    for(i= 1: row3)
        for(j= 1:col3)
            cPixelTrue = 0;
        
            if(posteriorApple(i,j)> f)
                cPixelTrue= 1;
            end;
            
            if(curImask(i,j)== 1 && cPixelTrue)
                TruePositive= TruePositive+1;
            elseif (curImask(i,j)== 0 && cPixelTrue)
                FalsePositive=FalsePositive+1;
            elseif (curImask(i,j)== 0 && ~cPixelTrue)
                TrueNegative= TrueNegative+1;
            else
                FalseNegative= FalseNegative+1;
            end;
            
        end;
    end;
    
    TPR= [ TPR, TruePositive/(TruePositive+FalseNegative )];
    FPR= [FPR, FalsePositive/(FalsePositive+TrueNegative)];
    
end;

figure;
plot(FPR, TPR);
xlabel({'FPR','False Positive Ratio'}); 
ylabel({'TPR', 'True Positive Ratio'}); 
title('ROC Curve');







