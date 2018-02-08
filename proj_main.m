% Execution of all parts.

clc;
clear;

%% Part i

% the code for plotting has been moved outside of the function 
[M1, M2] = part_i();
figure(1);
colormap([1 0 0; 1 1 1]);      % Set the color map, 1 is red, 2 is white.
image([-1.8 1.8],[-.7 .7],M1), % This plots the results.
axis xy                        % If you don't do this, vertical axis is inverted.


figure(2);
colormap([1 0 0; 1 1 1]); 
image([-1 1],[-1 1],M2),  
axis equal;               % makes the image square.
axis xy                   

%% Part ii
% parfor is used in the interest of runtime.
M3 = part_ii(0, 0, 0);
figure(3);
colormap([1 0 0; 1 1 1]);      
image([-1.8 1.8],[-.7 .7],M3), 
axis xy                        