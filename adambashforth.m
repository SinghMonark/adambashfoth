%                   Numerical Methods for Engineer
%                           Assignment

%                                                       Submitted by
%                                                       Monark Singh      B100206EE



%   This is a numerical method to solve first order differential equation of the form
%     dy/dx = f(x,y)
%   It takes the initial value (y0) and h input from user.
%   It calculates the first three points using Euler, Modified Euler or Ranga Kutta Method
%   as decided by the user and the remaining points using Adam Bashforth Method.
                
               
clc;
clear all;
close all;

disp('             Adams Bashforth Method       ');
disp('                                          ');
 
 syms x;
 syms y;
% adambash(x,y);

disp('dy/dx =');

disp(adambash(x,y));

h = input('Enter value of h   ');
disp('                        ');

y0 = input('Enter initial value: y0   ');
disp('                                ');

m= input('Enter the point at which output is required   ');
disp('                                                  ');

n = (m/h);

disp('          Select the method through which first three points will be calculated ');
disp('          1. Euler Method   ');  
disp('          2. Modified Euler ');
disp('          3. Ranga Kutta    ');
disp('                            ');


p = input('Enter choice   ');
disp('                    ');


switch p
    
    case 1
        
        [y2,y3,y4] = euler(y0,h);           % Calling Euler function
        
    case 2
        
        [y2,y3,y4] = ME(y0,h);              % Calling Modified Euler function
        
    case 3
        
        [y2,y3,y4] = RK(y0,h);              % Calling Ranga Kutta Method function
        
    otherwise
        
        display('Enter correct choice. ');
        
        p = input('Enter choice   ');

end

% Calculating u & v for plotting graph

u = n+50;
v = n+30;

for j = (1:u)
    
    x(1) = 0;
    
    x(j+1) = x(j) + h ;
end



y = [y0,y2,y3,y4];

% Calculating remaining points using Adam Bashforth Method

for i = (1:v)
    
y(i+4) = y(i+3) + (h/24)*[55*adambash(x(i+3),y(i+3))-59*adambash(x(i+2),y(i+2))+37*adambash(x(i+1),y(i+1))-9*adambash(x(i+1),y(i+1))];
    
end
    
disp('y(n) = ');
y(n)


for i=1:20

    plot(x(i),y(i),'k*');
   
hold on;
end

 plot(x(n+1),y(n+1),'r*');
 
 hold on;
 
 grid  on;
 
    xlabel(' x(n) ');
    ylabel(' y(n) ');
