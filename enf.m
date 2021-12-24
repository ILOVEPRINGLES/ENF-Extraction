function [ENF1,ENF2,ENF3,freqOfInterest,freqOfMax]=enf(x,Fs,BlockSize,zeropad,overlap,window,frequency)

L=length(x);%length of input sound signal

ColIncre=BlockSize-BlockSize*overlap;%column increment

rows=(1:BlockSize);

cols=(0:ColIncre:L-(BlockSize+1));

[Row,Col]=meshgrid(rows,cols);

OverlapIndex=Row+Col;%matrix overlap index 

x=x(OverlapIndex);%x matrix are assigned to the according overlapping index;new x is in overlap frame

w_Matrix=repmat(window,length(cols),1);%copy window array to form a matrix same size as x

x_windowed=x.*w_Matrix;% multiply them to apply window function on the input signal

zero_matrix=zeros(length(cols),zeropad);%create zeropad in same size matrix

x_zeroed=[x_windowed,zero_matrix];%append zeros at the end of each row of overlapped matrix

N=size(x_zeroed,2);%Determine the number of columns of x_zeroed matrix

x_fft=fft(x_zeroed,N,2);%fft of x_zeroed with N is the number of points in a row. 2 represents its in 2 dimension

freq_bins=Fs*[0:N-1]/N;

frequency_index=find(freq_bins>=frequency-1 & freq_bins<=frequency+1);%extract the matrix index of the interested frequency range

freqOfInterest=freq_bins(frequency_index);% frequency array 

x_mag=abs(x_fft);

ENF1=x_mag(:,frequency_index);%magnitude of fft of input signal in frequency of interest range

[ENF2,I]=max(ENF1);%maximum

freqOfMax=freqOfInterest(I);%frequency where maximum magnitude belongs

product=freqOfInterest.*ENF1;

num=sum(product,2);% sum the row of product

den=sum(ENF1,2);% sum the row of magnitude

ENF3=num./den;% make weighted magnitude a 1D array
     
end





