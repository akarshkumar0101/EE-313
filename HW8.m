
%% PROBLEM 1
clear
close all

Fs = 1000;
Ts = 1/Fs;
N = 256;
Nfft = N;

evN = N-mod(N,2);

% part a
t = (0:N-1)*Ts;

% part b
x = sin(2*pi*100*t);

subplot(3,2,[1,2]);
plot(t,x);
xlabel("Time (sec)");
ylabel("x(t) Value");
title("Original Signal in Time Domain");
xlim([min(t)-0.01,max(t)+0.01]);
ylim([min(x)-0.5,max(x)+0.5]);

% part c and d
Xf = fft(x, Nfft);
XfMag = abs(Xf);
XfMagnorm = XfMag/N;
Xfshift = fftshift(XfMagnorm);

P2 = Xfshift;
k2 = (-evN/2:N-1-evN/2);
k2len = size(k2,2);

P1 = P2(k2len/2:k2len-1);
k1 = k2(k2len/2:k2len-1);

f2 = (0:N-1)*(Fs/N) - (Fs-(mod(N,2)*(Fs/N)))/2;
f1 = f2(k2len/2:k2len-1);


subplot(3,2,3);
plot(k1, P1);
xlabel("Sample Number, k");
ylabel("X(f) Magnitude");
title("P1 vs. Sample Number");

subplot(3,2,4);
plot(k2, P2);
xlabel("Sample Number, k");
ylabel("X(f) Magnitude");
title("P2 vs. Sample Number");

subplot(3,2,5);
plot(f1, P1);
xlabel("Frequency (Hz)");
ylabel("X(f) Magnitude");
title("P1 vs. Frequency");

subplot(3,2,6);
plot(f2, P2);
xlabel("Frequency (Hz)");
ylabel("X(f) Magnitude");
title("P2 vs. Frequency");



%% PROBLEM 2
close all

y = sin(2*pi*200*t) + cos(2*pi*340*t);


Fs = 1000;
Ts = 1/Fs;
N = 256;
Nfft = N;

evN = N-mod(N,2);

% part a
t = (0:N-1)*Ts;

% part b
x = sin(2*pi*200*t) + cos(2*pi*340*t);

subplot(3,2,[1,2]);
plot(t,x);
xlabel("Time (sec)");
ylabel("x(t) Value");
title("Original Signal in Time Domain");
xlim([min(t)-0.01,max(t)+0.01]);
ylim([min(x)-0.5,max(x)+0.5]);

% part c
Xf = fft(x, Nfft);
XfMag = abs(Xf);
XfMagnorm = XfMag/N;
Xfshift = fftshift(XfMagnorm);

P2 = Xfshift;
k2 = (-evN/2:N-1-evN/2);
k2len = size(k2,2);

P1 = P2(k2len/2:k2len-1);
k1 = k2(k2len/2:k2len-1);

f2 = (0:N-1)*(Fs/N) - (Fs-(mod(N,2)*(Fs/N)))/2;
f1 = f2(k2len/2:k2len-1);


subplot(3,2,3);
plot(k1, P1);
xlabel("Sample Number, k");
ylabel("X(f) Magnitude");
title("P1 vs. Sample Number");

subplot(3,2,4);
plot(k2, P2);
xlabel("Sample Number, k");
ylabel("X(f) Magnitude");
title("P2 vs. Sample Number");

subplot(3,2,5);
plot(f1, P1);
xlabel("Frequency (Hz)");
ylabel("X(f) Magnitude");
title("P1 vs. Frequency");

subplot(3,2,6);
plot(f2, P2);
xlabel("Frequency (Hz)");
ylabel("X(f) Magnitude");
title("P2 vs. Frequency");

%% PROBLEM 3
close all

load x;

N = size(x,2);
Fs = 1000000;
Ts = 1/Fs;
Nfft = N;

evN = N-mod(N,2);

% part a
t = (0:N-1)*Ts;

% part b

subplot(3,2,[1,2]);
plot(t,x);
xlabel("Time (sec)");
ylabel("x(t) Value");
title("Original Signal in Time Domain");
xlim([min(t),max(t)]);
ylim([min(x)-0.5,max(x)+0.5]);

% part c
Xf = fft(x, Nfft);
XfMag = abs(Xf);
XfMagnorm = XfMag/N;
Xfshift = fftshift(XfMagnorm);

P2 = Xfshift;
k2 = (-evN/2:N-1-evN/2);
k2len = size(k2,2);
k2len = k2len - mod(k2len,2);

P1 = P2(k2len/2:k2len-1);
k1 = k2(k2len/2:k2len-1);

f2 = (0:N-1)*(Fs/N) - (Fs-(mod(N,2)*(Fs/N)))/2;
f1 = f2(k2len/2:k2len-1);


subplot(3,2,3);
plot(k1, P1);
xlabel("Sample Number, k");
ylabel("X(f) Magnitude");
title("P1 vs. Sample Number");

subplot(3,2,4);
plot(k2, P2);
xlabel("Sample Number, k");
ylabel("X(f) Magnitude");
title("P2 vs. Sample Number");

subplot(3,2,5);
plot(f1, P1);
xlabel("Frequency (Hz)");
ylabel("X(f) Magnitude");
title("P1 vs. Frequency");

subplot(3,2,6);
plot(f2, P2);
xlabel("Frequency (Hz)");
ylabel("X(f) Magnitude");
title("P2 vs. Frequency");

fprintf("3a) No it is almost impossible to tell the center frequencies due to the noise. " + newline);
fprintf("3b) It is easier to observe the center frequencies. There are two spikes in frequenices that stand out." + newline);
fprintf("3c) Frequencies observed: s1(t) @ 49950 Hz and s2(t) @ 349600 Hz.");
%49950 Hz and 349600 Hz




%% PROBLEM 4
close all

load y;
x = y;

N = size(x,2);
Fs = 1000000;
Ts = 1/Fs;
Nfft = N;

evN = N-mod(N,2);

% part a
t = (0:N-1)*Ts;

% part b
rx = real(x);
ix = imag(x);

subplot(3,2,1);
plot(t,rx);
xlabel("Time (sec)");
ylabel("x(t) Value");
title("Original Signal Real Part in Time Domain");
xlim([min(t),max(t)]);
ylim([min(rx),max(rx)]);

subplot(3,2,2);
plot(t,ix);
xlabel("Time (sec)");
ylabel("x(t) Value");
title("Original Signal Imag Part in Time Domain");
xlim([min(t),max(t)]);
ylim([min(ix),max(ix)]);

% part c
Xf = fft(x, Nfft);
XfMag = abs(Xf);
XfMagnorm = XfMag/N;
Xfshift = fftshift(XfMagnorm);

P2 = Xfshift;
k2 = (-evN/2:N-1-evN/2);
k2len = size(k2,2);
k2len = k2len - mod(k2len,2);

P1 = P2(k2len/2:k2len-1);
k1 = k2(k2len/2:k2len-1);

f2 = (0:N-1)*(Fs/N) - (Fs-(mod(N,2)*(Fs/N)))/2;
f1 = f2(k2len/2:k2len-1);


subplot(3,2,3);
plot(k1, P1);
xlabel("Sample Number, k");
ylabel("X(f) Magnitude");
title("P1 vs. Sample Number");

subplot(3,2,4);
plot(k2, P2);
xlabel("Sample Number, k");
ylabel("X(f) Magnitude");
title("P2 vs. Sample Number");

subplot(3,2,5);
plot(f1, P1);
xlabel("Frequency (Hz)");
ylabel("X(f) Magnitude");
title("P1 vs. Frequency");

subplot(3,2,6);
plot(f2, P2);
xlabel("Frequency (Hz)");
ylabel("X(f) Magnitude");
title("P2 vs. Frequency");


fprintf("4) 5 major frequencies were observed." + newline);
fprintf("List of signals observed in order of strength:" + newline);
fprintf("s1(t) @ 300100 Hz" + newline);
fprintf("s2(t) @ 399800 Hz" + newline);
fprintf("s3(t) @ 99690 Hz" + newline);
fprintf("s4(t) @ -269600 Hz" + newline);
fprintf("s5(t) @ -199400 Hz" + newline);


% 300100 Hz
% 399800 Hz
% 99690 Hz
% -269600 Hz
% -199400


