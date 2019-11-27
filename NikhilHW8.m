
%% PROBLEM 1
close all

Fs = 1000;

L = 256;

Lfft = L;

evenL = L-mod(L,2);

% part 1 a
t = (0:L-1)*1/Fs;

% part 1 b
x = sin(2*pi*100*t);

subplot(3,2,[1,2]);
plot(t,x);
xlabel("Time (s)");
title("Signal in Time Domain");
xlim([min(t),max(t)]);
ylim([min(x),max(x)]);

% part 1 c
P2 = fftshift(abs(fft(x, Lfft))/L);

k2 = (-evenL/2:L-1-evenL/2);

P1 = P2(length(k2)/2: length(k2)-1);

k1 = k2(length(k2)/2: length(k2)-1);

% part 1 d
f2 = (0:L-1)*(Fs/L) - (Fs-(mod(L,2)*(Fs/L)))/2;

f1 = f2(length(k2)/2: length(k2)-1);


subplot(3,2,3);
plot(k1, P1);
xlabel("Sample Number, k");
title("P1 vs. Sample Number");

subplot(3,2,4);
plot(k2, P2);
xlabel("Sample Number, k");
title("P2 vs. Sample Number");

subplot(3,2,5);
plot(f1, P1);
xlabel("Frequency (Hz)");
title("P1 vs. Frequency");

subplot(3,2,6);
plot(f2, P2);
xlabel("Frequency (Hz)");
title("P2 vs. Frequency");



%% PROBLEM 2
close all

y = sin(2*pi*200*t) + cos(2*pi*340*t);


Fs = 1000;
L = 256;
Lfft = L;

evenL = L-mod(L,2);

t = (0:L-1)*1/Fs;

x = sin(2*pi*200*t) + cos(2*pi*340*t);

subplot(3,2,[1,2]);
plot(t,x);
xlabel("Time (s)");
title("Signal in Time Domain");
xlim([min(t),max(t)]);
ylim([min(x),max(x)]);

P2 = fftshift(abs(fft(x, Lfft))/L);

k2 = (-evenL/2:L-1-evenL/2);

P1 = P2(length(k2)/2:length(k2)-1);

k1 = k2(length(k2)/2:length(k2)-1);

f2 = (0:L-1)*(Fs/L) - (Fs-(mod(L,2)*(Fs/L)))/2;

f1 = f2(length(k2)/2:length(k2)-1);


subplot(3,2,3);
plot(k1, P1);
xlabel("Sample Number, k");
title("P1 vs. Sample Number");

subplot(3,2,4);
plot(k2, P2);
xlabel("Sample Number, k");
title("P2 vs. Sample Number");

subplot(3,2,5);
plot(f1, P1);
xlabel("Frequency (Hz)");
title("P1 vs. Frequency");

subplot(3,2,6);
plot(f2, P2);
xlabel("Frequency (Hz)");
title("P2 vs. Frequency");

%% PROBLEM 3
close all

load x.mat;

L = length(x);
Fs = 1000000;
Lfft = L;

evenL = L-mod(L,2);

t = (0:L-1)*1/Fs;


subplot(3,2,[1,2]);
plot(t,x);
xlabel("Time (s)");
title("Signal in Time Domain");
xlim([min(t),max(t)]);
ylim([min(x),max(x)]);

% part c

P2 = fftshift(abs(fft(x, Lfft))/L);

k2 = (-evenL/2:L-1-evenL/2);

len = length(k2) - mod(length(k2),2);

P1 = P2(len/2:len-1);

k1 = k2(len/2:len-1);

f2 = (0:L-1)*(Fs/L) - (Fs-(mod(L,2)*(Fs/L)))/2;

f1 = f2(len/2:len-1);


subplot(3,2,3);
plot(k1, P1);
xlabel("Sample Number, k");
title("P1 vs. Sample Number");

subplot(3,2,4);
plot(k2, P2);
xlabel("Sample Number, k");
title("P2 vs. Sample Number");

subplot(3,2,5);
plot(f1, P1);
xlabel("Frequency (Hz)");
title("P1 vs. Frequency");

subplot(3,2,6);
plot(f2, P2);
xlabel("Frequency (Hz)");
title("P2 vs. Frequency");

fprintf("3a) The noise makes it nearly impossible to distinguish the center frequencies. " + newline);
fprintf("3b) Two speaks in frequencies stand out making it easier to detect the center frequency." + newline);
fprintf("3c) The two frequencies observed are 49950 Hz and 349600 Hz.");
%49950 Hz and 349600 Hz




%% PROBLEM 4
close all

load y.mat;


L = length(y);
Fs = 1000000;
Lfft = L;

evenL = L-mod(L,2);

t = (0:L-1)*1/Fs;


subplot(3,2,1);
plot(t,real(y));
xlabel("Time (s)");
title("Real Part of Signal in Time Domain");
xlim([min(t),max(t)]);
ylim([min(real(y)),max(real(y))]);

subplot(3,2,2);
plot(t,imag(y));
xlabel("Time (s)");
title("Imaginary Part of Signal in Time Domain");
xlim([min(t),max(t)]);
ylim([min(imag(y)),max(imag(y))]);


P2 = fftshift(abs(fft(y, Lfft))/L);

k2 = (-evenL/2:L-1-evenL/2);

len = length(k2) - mod(length(k2),2);

P1 = P2(len/2:len-1);

k1 = k2(len/2:len-1);

f2 = (0:L-1)*(Fs/L) - (Fs-(mod(L,2)*(Fs/L)))/2;
        
f1 = f2(len/2:len-1);


subplot(3,2,3);
plot(k1, P1);
xlabel("Sample Number, k");
title("P1 vs. Sample Number");

subplot(3,2,4);
plot(k2, P2);
xlabel("Sample Number, k");
title("P2 vs. Sample Number");

subplot(3,2,5);
plot(f1, P1);
xlabel("Frequency (Hz)");
title("P1 vs. Frequency");

subplot(3,2,6);
plot(f2, P2);
xlabel("Frequency (Hz)");
title("P2 vs. Frequency");


fprintf("4) There were 5 frequencies observed:" + newline);
fprintf("s1 freq = 300100 Hz" + newline);
fprintf("s2 freq = 399800 Hz" + newline);
fprintf("s3 freq = 99690 Hz" + newline);
fprintf("s4 freq = -269600 Hz" + newline);
fprintf("s5 freq = -199400 Hz" + newline);



