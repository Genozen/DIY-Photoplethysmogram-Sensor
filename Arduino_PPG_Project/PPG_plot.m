%% original signal
clc;
load('ppgyout.mat');

Fs = 222.4;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 13344;             % Length of signal
t = (0:L-1)*T;        % Time vector


figure(1)
plot(yout);

figure(2);
Y = fft(yout);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
plot(f,P1) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')

yout_new = sgolayfilt(yout,1,189)
figure(8)
plot(yout_new);

%{
pxx = pwelch(y);

figure(1);
plot(10*log10(pxx));
xlabel('Frequency (Hz)')
ylabel('PSD (dB/Hz)')

figure(2);
plot(y);

figure(3);
plot(sgolayfilt(y,1,189));
%}


%% moving average plotting
clc;
load('ppgyout_moveavg.mat');

Fs = 222.4;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 13310;             % Length of signal
t = (0:L-1)*T;        % Time vector



%smooth out more
yout2_new = sgolayfilt(yout2,1,189)
figure(3)
plot(yout2_new);

figure(4);
Y = fft(yout2_new);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
plot(f,P1) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')

figure(5)
plot(yout2); hold on;
plot(yout2_new);





%{
pxx2 = pwelch(yout2);
figure(4);
plot(10*log10(pxx2));
xlabel('Frequency (Hz)')
ylabel('PSD (dB/Hz)')

figure(5);
plot(yout2);

figure(6);
plot(sgolayfilt(yout2,1,189));

s = yout2/sqrt(sum(abs(yout2 .^2)) / 1e6);
figure(7);
plot(sgolayfilt(s,1,189));

figure(8);
z=fft(s);
freqz(z)

Fs = 1000;            % Sampling frequency  (# sample/second)                  
T = 1/Fs;             % Sampling period       
L = 5185;             % Length of signal
t = (0:L-1)*T;        % Time vector
Y=fft(yout2);

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L/2))/L;
figure(9);
plot(f,P1) ;
title('Single-Sided Amplitude Spectrum of X(t)');
xlabel('f (Hz)');
ylabel('|P1(f)|');
%}


%{
A=meas.Temp;
t=meas.Time;
Fs=1000;
h1=spectrum.pwelch;
set(h1,'Windowname','Hann');
set(h1,'OverlapPercent',66.7);
set(h1,'SegmentLength',1024);
myPsd=psd(h1,A,'Fs',Fs);
figure(1);
semilogx(myPsd.Frequencies/(2*pi),myPsd.Data);
set(gca,'XLim',[3 100]);
%it is seen that your data contains noise higher than 50Hz
fc=30;%cutoff frequency(Hz)
fs=1000;%sampling frequency(assumed)
[b,a] = butter(5,fc/(fs/2),'low');
y=filter(b,a,A);
figure(2);
plot(t,A);hold on;plot(t,y);legend('original','filtered');
hold off;
%}