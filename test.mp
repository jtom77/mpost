beginfig(1);

    input macros;
    u := 1cm;
    path c, d;

    c := unitsquare xscaled 5u yscaled u;
    d := unitsquare xscaled 8u yscaled u;


    c := c belowof d;
    
    fill d withcolor red;
    fill c withcolor green;

    show cycle(c);
    
    for i=0 upto length(c):
        show point i of c;
    endfor;

    z0 = (0,0);
    vardef tt(expr l) = save z0; z0 = (1,0); enddef;

    tt("a");




endfig;
end