du = pi/12;   %setting the step size in u and v in advance.  This makes it easier to change them and
dv = pi/8;    %we'll be making reference to them later.
u = [0:du:pi];
v = [0:dv:2*pi];

[U,V] = meshgrid(u,v);  %produces two matrices U and V.
                        %For the i-th element of the list u and the j-th element of the list v
                        %the ij entry of U has the i-th element of u 
                        %and the ij entry of V has the j-th element of v
                        %So taking the ij entry of both gets you the i-th element of u and the j-th of v.


X = 4 * sin(U).*cos(V); %the ij-th element of X encodes the x value corresponding to the i-th element of u and j-th of v.
Y = 4 * sin(U).*sin(V);
Z = 4 * cos(U);

planerho = [0:1:4];
planez = [-4:1:4];

[PlaneRho, PlaneZ] = meshgrid(planerho,planez);

x = [-4:1:4];
y = [-4: 1: 4];
[HorPlaneX,HorPlaneY] = meshgrid(x,y);



figure(1)
surf(X, Y, Z, 'FaceAlpha', 0.8, 'FaceColor', 'y', 'EdgeColor', 'c');
xlabel('x')
ylabel('y')
zlabel('z')
axis('equal')
hold on
plot3([0,0], [0,0], [-5,5], 'k', 'LineWidth', 3)
scatter3([0,4*cos(-pi/4)*sin(pi/6)], [0, 4*sin(-pi/4)*sin(pi/6)], [0, 4*cos(pi/6)], 'ro', 'filled')

figure(2)
surf(X, Y, Z, 'FaceAlpha', 0.5, 'FaceColor', 'y', 'EdgeColor', 'c');
xlabel('x')
ylabel('y')
zlabel('z')
axis('equal')
hold on
plot3([0,0], [0,0], [-5,0], 'k', 'LineWidth', 3)
plot3([0,0], [0,0], [4*cos(pi/6), 5], 'k', 'LineWidth', 3)
surf(PlaneRho*cos(-pi/4), PlaneRho*sin(-pi/4), PlaneZ, 'FaceColor', 'b', 'FaceAlpha', 0.4);
plot3([0,4*cos(-pi/4)*sin(pi/6), 0,0], [0,4*sin(-pi/4)*sin(pi/6),0,0], [0,4*cos(pi/6),4*cos(pi/6),0], 'color', 'r', 'LineWidth', 5)

figure(3)
surf(X, Y, Z,  'FaceColor', 'y', 'FaceAlpha', 0.1, 'EdgeColor', 'c');
xlabel('x')
ylabel('y')
zlabel('z')
axis('equal')
hold on
plot3([0,0], [0,0], [-5,0], 'k', 'LineWidth', 3)
plot3([0,0], [0,0], [4*cos(pi/6), 5], 'k', 'LineWidth', 3)
surf(PlaneRho*cos(-pi/4), PlaneRho*sin(-pi/4), PlaneZ, 'FaceColor', 'b', 'FaceAlpha', 0.4);
plot3([0,4*cos(-pi/4)*sin(pi/6), 0,0], [0,4*sin(-pi/4)*sin(pi/6),0,0], [0,4*cos(pi/6),4*cos(pi/6),0], 'color', 'r', 'LineWidth', 5)
arcU = [0:pi/60:pi/6];
plot3(4*cos(-pi/4)*sin(arcU), 4*sin(-pi/4)*sin(arcU), 4*cos(arcU), 'color', 'y', 'LineWidth', 5)
plot3(cos(-pi/4)*sin(arcU), sin(-pi/4)*sin(arcU), cos(arcU), 'color', 'y', 'LineWidth', 5)
view([-45,0])

figure(4)
surf(X, Y, Z,  'FaceColor', 'y', 'FaceAlpha', 0.5, 'EdgeColor', 'c');
xlabel('x')
ylabel('y')
zlabel('z')
axis('equal')
hold on
plot3([0,0], [0,0], [-5,5], 'k', 'LineWidth', 3)
surf(HorPlaneX, HorPlaneY, 4*cos(pi/6)*ones(size(HorPlaneX)), 'FaceColor', 'b', 'FaceAlpha', 0.3)
plot3([4*cos(-pi/4)*sin(pi/6), 0], [4*sin(-pi/4)*sin(pi/6),0], [4*cos(pi/6),4*cos(pi/6)], 'color', 'r', 'LineWidth', 5)

figure(5)
surf(X, Y, Z,  'FaceColor', 'y', 'FaceAlpha', 0.3, 'EdgeColor', 'c');
xlabel('x')
ylabel('y')
zlabel('z')
axis('equal')
hold on
surf(HorPlaneX, HorPlaneY, 4*cos(pi/6)*ones(size(HorPlaneX)), 'FaceColor', 'b', 'FaceAlpha', 0.3)
plot3([0,4*cos(-pi/4)*sin(pi/6),4*cos(-pi/4)*sin(pi/6), 0], [0,0,4*sin(-pi/4)*sin(pi/6),0], [4*cos(pi/6),4*cos(pi/6),4*cos(pi/6),4*cos(pi/6)], 'color', 'r', 'LineWidth', 5)
arcV = [0:pi/20:7*pi/4];
plot3(4*cos(arcV)*sin(pi/6), 4*sin(arcV)*sin(pi/6), 4*cos(pi/6)*ones(size(arcV)), 'color', 'y', 'LineWidth', 5)
plot3(cos(arcV)*sin(pi/6), sin(arcV)*sin(pi/6), 4*cos(pi/6)*ones(size(arcV)), 'color', 'y', 'LineWidth', 5)
plot3([0,0], [-4, 4], [3*cos(pi/6), 3*cos(pi/6)], 'color', 'k', 'LineWidth', 3)
plot3([-4,4], [0,0], [3*cos(pi/6), 3*cos(pi/6)], 'color', 'k', 'LineWidth', 3)
axis('equal')
view([0,90])


figure(6)
topu = [0:du:pi/2];
topv = [0:dv:2*pi];

[TopU, TopV] = meshgrid(topu, topv);

TopX = 4 * sin(TopU).*cos(TopV); %the ij-th element of X encodes the x value corresponding to the i-th element of u and j-th of v.
TopY = 4 * sin(TopU).*sin(TopV);
TopZ = 4 * cos(TopU);

surf(TopX, TopY, TopZ)
axis('equal')
xlabel('x')
ylabel('y')
zlabel('z')
