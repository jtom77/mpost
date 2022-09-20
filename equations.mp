z3=z1+(.1in,.6in);
z20=whatever[z1,z3];

show z3;
show z20;

z4=-z5;
show z4;
show z5;

x4=7;

show z4;
show z5;

showdependencies;

scantokens "z6=-z7=(0,1)";

show z6;
show z7;

forsuffixes $=a,b,c: z.$=origin; endfor;

show z.a;
show z.b;
show z.d;



end;