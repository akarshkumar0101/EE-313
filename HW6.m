
%% PROBLEM 1
t=[-2:0.01:5];

y=p1(t);
plot(t,y);title('P1');ylim([-1.25 1.25]);

%% PROBLEM 2
t=[-2:0.01:5];

y1=p1(t) .* (u(t+2)-u(t-1));
y2=p1(t) .* u(-t);
y3=p1(2*t-1);
y4=p1(-t+1) .* (u(t)-u(t-2));

subplot(2,2,1);plot(t,y1,'LineWidth',2);title('P2 Y1');grid;ylim([-1.25 1.25]);
subplot(2,2,2);plot(t,y2,'LineWidth',2);title('P2 Y2');grid;ylim([-1.25 1.25]);
subplot(2,2,3);plot(t,y3,'LineWidth',2);title('P2 Y3');grid;ylim([-1.25 1.25]);
subplot(2,2,4);plot(t,y4,'LineWidth',2);title('P2 Y4');grid;ylim([-1.25 1.25]);

%% PROBLEM 3
n = [0:1:20];

p3x = sin(n .* pi/6);
p3y1 = sin((-n) .* pi/6);
p3y2 = sin((3*n) .* pi/6);
p3y3 = sin((-n-6) .* pi/6);
p3y4 = sin((n/3+3) .* pi/6);

for i = 0:20
    if mod(i,3)~=0
       p3y4(i+1)=0;
    end
end

subplot(2,2,1);stem(n,p3y1);title('P3 Y1');grid;grid;ylim([-1.25 1.25]);
subplot(2,2,2);stem(n,p3y2);title('P3 Y2');grid;grid;ylim([-1.25 1.25]);
subplot(2,2,3);stem(n,p3y3);title('P3 Y3');grid;grid;ylim([-1.25 1.25]);
subplot(2,2,4);stem(n,p3y4);title('P3 Y4');grid;grid;ylim([-1.25 1.25]);

%stem(n,p3y4);

%% PROBLEM 4
t=[-1:0.01:8];

p4x1=p4in(t);
p4x2=p4in(t-1);
p4x3=-p4in(t-2)-p4in(t-3);
p4x4=p4in(t)+p4in(t-1)-p4in(t-2)-p4in(t-3);


p4y1=p4out(t);
p4y2=p4out(t-1);
p4y3=-p4out(t-2)-p4out(t-3);
p4y4=p4out(t)+p4out(t-1)-p4out(t-2)-p4out(t-3);



subplot(4,2,1);plot(t,p4x1,'LineWidth',2);title('P4 X1');grid;ylim([-2 2]);
subplot(4,2,2);plot(t,p4y1,'LineWidth',2);title('P4 Y1');grid;ylim([-2 2]);
subplot(4,2,3);plot(t,p4x2,'LineWidth',2);title('P4 X2');grid;ylim([-2 2]);
subplot(4,2,4);plot(t,p4y2,'LineWidth',2);title('P4 Y2');grid;ylim([-2 2]);
subplot(4,2,5);plot(t,p4x3,'LineWidth',2);title('P4 X3');grid;ylim([-2 2]);
subplot(4,2,6);plot(t,p4y3,'LineWidth',2);title('P4 Y3');grid;ylim([-2 2]);
subplot(4,2,7);plot(t,p4x4,'LineWidth',2);title('P4 X4');grid;ylim([-2 2]);
subplot(4,2,8);plot(t,p4y4,'LineWidth',2);title('P4 Y4');grid;ylim([-2 2]);


function u_out=u(t)
u_out=heaviside(t);
end

function p1_out=p1(t)
p1_out = (heaviside(t+1)-heaviside(t-1)).*(-3/4 .* t + 1/4);
p1_out = p1_out+(heaviside(t-1)-heaviside(t-3)).*(-1/2 .* t + 1);
end

function x_out=x(n)
x_out = sin(n*pi/6);
end

function y=p4in(t)
y=u(t)-u(t-1);
end

function y=p4out(t)
y=u(t)-u(t-1)+(u(t-1)-u(t-2)).*(2-t);
end
