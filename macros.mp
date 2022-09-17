boolean DEBUG; DEBUG = false;

bboxmargin := 0pt;

numeric u; u=2cm;
path p, q;
picture pic;
color upper, lower, clr;
upper := (1,0,1);
lower := (0,1,1);
clr := upper;

vardef height(expr p) = (ypart (ulcorner bbox p)) - (ypart (llcorner bbox p)) enddef;

vardef unitvector primary z = z/abs z enddef;

vardef round_corners (expr p) =
    save a, b; pair a[], b[];
    for i=1 upto length(p) - 1:
        a[i] := point i of p;
        b[i] := point (i+1) of p;
        
    endfor;

enddef;

vardef node(expr xscale, a, flip) = 
    save pic, lab, p, bb;
    begingroup
    bboxmargin := 15pt;
    picture pic, lab;
    path p, bb;
    lab := image(label(a, origin));
    p := unitsquare;
    p := p shifted (-center p);
    p := p xscaled xscale yscaled (height(lab));
    p := rounded(p, 2mm, flip);
    bb := bbox lab;
    bboxmargin := 0pt;
    pic := image(
        fill p withcolor clr;
        draw p;
        if DEBUG: draw bb withpen pencircle scaled 5pt withcolor 0.8 white; fi;    
        draw lab;
    );
    pic := pic shifted -center pic;
    endgroup;
    pic
enddef;

vardef rounded(expr p, u, flip) =
    save q;
    path q;
    q = (llcorner p)--(lrcorner p)
        --(urcorner p shifted (0, -u)){up}..(urcorner p shifted (-u, 0)){left}
        --(ulcorner p shifted (u, 0)){left}..(ulcorner p shifted (0, -u)){down}
        --cycle;
    if flip:
        q := q shifted -center p yscaled -1 shifted center p;
    fi;
    q
enddef;


vardef split_node(expr xscale, a, b) = 
    save pic, p;
    picture pic, p[];
    clr := upper;
    p0 := node(xscale, a, false);
    clr := lower;
    p1 := node(xscale, b, true);
    p0 := p0 shifted (0, 0.5*(height(p0) + height(p1)));
    pic := image(
        draw p0;
        draw p1;
        if DEBUG: draw origin withpen pencircle scaled 4pt; fi;
    );
    pic
enddef;


vardef ell_node(expr xscale, yscale, lab) = 
    save c; path c;
    c := fullcircle xscaled xscale yscaled yscale;
    image(
        fill c withcolor clr;
        draw c;
        label(lab scaled 2, origin);
    )
enddef;



primarydef c belowof d = c shifted (.5[llcorner d, lrcorner d] - .5[ulcorner c, urcorner c]) enddef;


