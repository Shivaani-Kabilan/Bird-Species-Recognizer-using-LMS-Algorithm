[signal1,fs] = audioread('E:\ACADEMICS\DSP\Project\wav\jungle blabber original.wav');
 signal1 = signal1(:,1);
%  sound(signal1,fs)    % playing bird signal
 

hlms1 = dsp.LMSFilter('Length',11, ...
 'Method','Normalized LMS',...
 'AdaptInputPort',true, ...
 'StepSizeSource','Input port', ...
 'WeightsOutputPort',false);
hfilt1 = dsp.FIRFilter('Numerator', fir1(10,[.5, .75]));
x = 0.1*randn(1526400,1); % Noise
%sound(x,fs)   % playing waterfall noise
d = step(hfilt1,x) + signal1 ; % Noise + Signal
%sound(d,fs)   % playing noise+bird
a = 1; % adaptation control
mu = 0.05; % step size
[y1, err1] = step(hlms1,x,d,mu,a);

sound(err1,fs)   % playing filtered signal

figure
subplot(4,2,1)
plot(signal1(:,1))      % plot bird signal
title('bird signal')

data_fft = fft(signal1);
subplot(4,2,2)               % plot of FFT of bird signal
plot(abs(data_fft(:,1)))
title('FFT of bird')

subplot(4,2,3)
plot(x)            % plot of noise
title('noise')

noise_fft=fft(x);
subplot(4,2,4)     % plot of FFT of noise
plot(abs(noise_fft))
title('FFT of noise')

subplot(4,2,5)
plot(d)            % plot of noise+signal
title('noise+signal')

d_fft=fft(d);
subplot(4,2,6)     % plot of FFT of noise+signal
plot(abs(d_fft))
title('FFT of noise+signal')

subplot(4,2,7)
plot(err1)            % plot of filtered signal
title('plot of filtered signal')

err1_fft=fft(err1);
subplot(4,2,8)     % plot of FFT of filtered signal
plot(abs(err1_fft))
title('plot of FFT of filtered signal')





% Crow
[signal2,fs] =audioread('E:\ACADEMICS\DSP\Project\wav\2_Crows_original.wav');
signal2 = signal2(:,1);
 hlms2 = dsp.LMSFilter('Length',11, ...
 'Method','Normalized LMS',...
 'AdaptInputPort',true, ...
 'StepSizeSource','Input port', ...
 'WeightsOutputPort',false);
 hfilt2 = dsp.FIRFilter('Numerator', fir1(10,[.5, .75]));
 x = 0.1*randn(265818,1); % Noise
 d2 = step(hfilt2,x) + signal2 ; % Noise + Signal
 a = 1; % adaptation control
 mu = 0.05; % step size
 [y2, err2] = step(hlms2,x,d2,mu,a);
 

 % sparow
[signal3,fs] =audioread('E:\ACADEMICS\DSP\Project\wav\sparow.wav');
signal3 = signal3(:,1);
hlms3 = dsp.LMSFilter('Length',11, ...
 'Method','Normalized LMS',...
 'AdaptInputPort',true, ...
 'StepSizeSource','Input port', ...
 'WeightsOutputPort',false);
hfilt3 = dsp.FIRFilter('Numerator', fir1(10,[.5, .75]));
x = 0.1*randn(207606,1); % Noise
d3 = step(hfilt3,x) + signal3 ; % Noise + Signal
a = 1; % adaptation control
mu = 0.05; % step size
[y3, err3] = step(hlms3,x,d3,mu,a);


% Cricket
[signal4,fs] =audioread('E:\ACADEMICS\DSP\Project\wav\Cricket.wav');
signal4 = signal4(:,1);
hlms4 = dsp.LMSFilter('Length',11, ...
 'Method','Normalized LMS',...
 'AdaptInputPort',true, ...
 'StepSizeSource','Input port', ...
 'WeightsOutputPort',false);
hfilt4 = dsp.FIRFilter('Numerator', fir1(10,[.5, .75]));
x = 0.1*randn(345945,1); % Noise
d4 = step(hfilt4,x) + signal4 ; % Noise + Signal
a = 1; % adaptation control
mu = 0.05; % step size
[y4,err4] = step(hlms4,x,d4,mu,a);


% kingfisher
[signal5,fs] =audioread('E:\ACADEMICS\DSP\Project\wav\kingfisher.wav');
signal5 = signal5(:,1);
hlms5 = dsp.LMSFilter('Length',11, ...
 'Method','Normalized LMS',...
 'AdaptInputPort',true, ...
 'StepSizeSource','Input port', ...
 'WeightsOutputPort',false);
hfilt5 = dsp.FIRFilter('Numerator', fir1(10,[.5, .75]));
x = 0.1*randn(409007,1); % Noise
d5 = step(hfilt5,x) + signal5 ; % Noise + Signal
a = 1; % adaptation control
mu = 0.05; % step size
[y5,err5] = step(hlms5,x,d5,mu,a);


% correlation
inp=err3;
r1=xcorr(inp,signal1);
m1=max(r1);

r2=xcorr(inp,signal2);
m2=max(r2);

r3=xcorr(inp,signal3);
m3=max(r3);

r4=xcorr(inp,signal4);
m4=max(r4);

r5=xcorr(inp,signal5);
m5=max(r5);

% figure
% subplot(3,2,1)
% stem(r1)
% title('correlation plot 1')
% 
% subplot(3,2,2)
% stem(r2)
% title('correlation plot 2')
% 
% subplot(3,2,3)
% stem(r3)
% title('correlation plot 3')
% 
% subplot(3,2,4)
% stem(r4)
% title('correlation plot 4')
% 
% subplot(3,2,5)
% stem(r5)
% title('correlation plot 5')

a=[m1 m2 m3 m4 m5];
m=max(a);
if m<=m1
 disp('jungle babbler');
elseif m<=m2
 disp('crow');
elseif m<=m3
 disp('Sparrow');
elseif m<=m4
 disp('Cricket');
elseif m<=m5
 disp('kingfisher');
else
 disp('No match');
end