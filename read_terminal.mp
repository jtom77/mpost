string s[];
s1 = "abra";
path p[];
p1=(0,0)..(3,3);
p2=(0,0)..(3,3)..cycle;
tracingonline:=1; 
scrollmode;
forever:
    message "Gimme an expression: ";
    s0:=readstring;
    show scantokens s0;
endfor;