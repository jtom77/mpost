input boxes
beginfig(49);
boxit.aa(btex Node1 etex); 
boxit.bb(btex Node2 etex); 
boxit.cc(btex Node3 etex); 

show aa.c;
show aa.n;
aa.dx=3cm;
aa.c = origin;

% fixsize(aa);
fixpos(aa);


show aa.c;
show aa.n;


bb.n=aa.s;
cc.nw=aa.ne;

drawboxed(aa, bb, cc);



circleit.ca(btex Circle1 etex);
circleit.cb(btex Circle2 etex);

ca.c = (0,-3cm);
cb.n = ca.s;

drawboxed(ca, cb);

draw ca.n withpen pencircle scaled 5pt;

endfig;
end