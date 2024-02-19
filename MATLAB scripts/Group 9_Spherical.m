disp('Spherical Modern Variant')

syms a1 a2 a3 d3

%% Link lengths

a1 = 3;
a2 = 3;
a3 = 2;

%% Joint Variables

d3 = 2;

%% D-H Parameters [theta, d, r, alpha, offset]

H0_1 = Link([0,a1,0,pi/2,0,0]);
H0_1.qlim = pi/180*[-90 90];

H1_2 = Link([0,0,a2,pi/2,0, 0]);
H1_2.qlim = pi/180*[0 90];

H2_3 = Link([0,0,0,0,1,a3]);
H2_3.qlim = [0 d3];

%% Build Mechanical Manipulator

Spherical_Modern = SerialLink([H0_1 H1_2 H2_3], 'name', 'RRP');
Spherical_Modern.plot([0 0 0], 'workspace', [-10 10 -10 10 -5 10])
Spherical_Modern.teach
