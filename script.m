%Script step2
x=audioread("ELE792\recording.wav");% input sound signal
window=hanning(705600,'periodic')';%window function, 1 dimentional array
[ENF1,ENF2,ENF3,freqOfInterest,freqOfMax]=enf(x,44100,705600,0,0.5,window,60);% apply the function,change the "frequency" value to surf plot 60hz, 120hz,180hz,240hz magnitude spectrum
surf(freqOfInterest,1:size(ENF1,1),ENF1);% surface plot the magnitude spectrum
%%
%Script step 3
x1=audioread("ELE792\ground truth.wav");% input sound signal 1
x2=audioread("ELE792\recording.wav");% input sound signal 2
window=hanning(705600,'periodic')';%window function, 1 dimentional array
[ENF1_1,ENF2_1,ENF3_1,freqOfInterest_1,freqOfMax_1]=enf(x1,44100,705600,0,0.5,window,120);% apply the function
[ENF1_2,ENF2_2,ENF3_2,freqOfInterest_2,freqOfMax_2]=enf(x2,44100,705600,0,0.5,window,120);% apply the function
ENF3_1_sub=ENF3_1-mean(ENF3_1);% subtract the mean from weighted magnitude
ENF3_2_sub=ENF3_2-mean(ENF3_2);% subtract the mean from weighted magnitude
figure;surf(freqOfInterest_1,1:size(ENF1_1,1),ENF1_1); % surface plot the magnitude spectrum
figure;surf(freqOfInterest_2,1:size(ENF1_2,1),ENF1_2);
[r,lags]=xcorr(ENF3_1_sub,ENF3_2_sub);% apply cross correlation to compare two signals

figure;plot(1:33,freqOfMax_1,1:33,freqOfMax_2);legend('ground truth','recording'); % plot of frequency at maximum magnitude

figure;plot(lags); % plot the cross correlation

figure;plot(1:33,ENF3_1,1:27,ENF3_2);legend('ground truth','recording');% plot the weighted magnitude

%%
%Script step 4
x1=audioread("ELE792\ground truth.wav");% input sound signal 1
x2=audioread("ELE792\recording.wav");% input sound signal 2
x1_filter=filtfilt(SOS,G,x1);% apply low-pass filter on signal
x1_down=downsample(x1_filter,100);% downsample by 100
x2_filter=filtfilt(SOS,G,x2);% apply low-pass filter on signal
x2_down=downsample(x2_filter,100);% downsample by 100
window=hanning(7056,'periodic')';%window function, 1 dimentional array
[ENF1_1,ENF2_1,ENF3_1,freqOfInterest_1,freqOfMax_1]=enf(x1_down,441,7056,9328,0.5,window,120);% apply the function
[ENF1_2,ENF2_2,ENF3_2,freqOfInterest_2,freqOfMax_2]=enf(x2_down,441,7056,9328,0.5,window,120);% apply the function
ENF3_1_sub=ENF3_1-mean(ENF3_1);% subtract the mean from weighted magnitude
ENF3_2_sub=ENF3_2-mean(ENF3_2);% subtract the mean from weighted magnitude
figure;surf(freqOfInterest_1,1:size(ENF1_1,1),ENF1_1);% surface plot the magnitude spectrum
figure;surf(freqOfInterest_2,1:size(ENF1_2,1),ENF1_2);
[r,lags]=xcorr(ENF3_1_sub,ENF3_2_sub);% apply cross correlation to compare two signals

figure;plot(1:74,freqOfMax_1,1:74,freqOfMax_2);legend('ground truth','recording');% plot of frequency at maximum magnitude

figure;plot(r); % plot the cross correlation

figure;plot(1:33,ENF3_1,1:27,ENF3_2);legend('ground truth','recording');% plot the weighted magnitude

%%
%Script step 5
x1=audioread("ELE792\ground truth 2.wav");% input sound signal 1
x2=audioread("ELE792\recording 2.wav");% input sound signal 2
x1_filter=filtfilt(SOS,G,x1);% apply low-pass filter on signal
x1_down=downsample(x1_filter,100);% downsample by 100
x2_filter=filtfilt(SOS,G,x2);% apply low-pass filter on signal
x2_down=downsample(x2_filter,100);% downsample by 100
window=hanning(7056,'periodic')';%window function, 1 dimentional array
[ENF1_1,ENF2_1,ENF3_1,freqOfInterest_1,freqOfMax_1]=enf(x1_down,441,7056,9328,0.5,window,120);% apply the function
[ENF1_2,ENF2_2,ENF3_2,freqOfInterest_2,freqOfMax_2]=enf(x2_down,441,7056,9328,0.5,window,120);% apply the function
ENF3_1_sub=ENF3_1-mean(ENF3_1);% subtract the mean from weighted magnitude
ENF3_2_sub=ENF3_2-mean(ENF3_2);% subtract the mean from weighted magnitude
figure;surf(freqOfInterest_1,1:size(ENF1_1,1),ENF1_1);% surface plot the magnitude spectrum
figure;surf(freqOfInterest_2,1:size(ENF1_2,1),ENF1_2);
[r,lags]=xcorr(ENF3_1_sub,ENF3_2_sub);% apply cross correlation to compare two signals

figure;plot(1:74,freqOfMax_1,1:74,freqOfMax_2);legend('ground truth','recording');% plot of frequency at maximum magnitude

figure;plot(r);% plot the cross correlation
figure;plot(1:30,ENF3_1,1:21,ENF3_2);legend('ground truth','recording');% plot the weighted magnitude