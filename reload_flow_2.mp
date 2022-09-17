verbatimtex
%&latex
\documentclass{article}
\usepackage{listings}
\begin{document}
etex

beginfig(1)

input macros;

pickup pencircle scaled 1.5bp;

%%% Static Variables %%%

ahlength := 4mm;
ahangle := 40;

color clr[];
clr0 := (1,0.5,0.1);
clr1 := white;
clr2 := black;
clr3 := .8white;

pen ellpen; 
ellpen := pencircle yscaled 7;


bboxmargin:=0.2cm;

numeric u; u=2.2cm;
numeric node_width; node_width := 3u;
numeric yshift; yshift=2u;
numeric xshift; xshift=3u;
numeric node_shift; node_shift=0.5u;
path sq, c;


picture lab[]u, lab[]l; 
path p, p[]u, p[]l, elltemplate;
pair shift[];

elltemplate := fullcircle xscaled 2u yscaled .8u;


lab1u := btex \texttt{AbstractDocumentBean.initializeDataModel()} etex;
lab1l := btex something etex;
shift1 := (0,0);

lab2u := btex Cached Data available? etex;
lab2l := btex \texttt{contextHolder.getPagedResultList(getDocumentLocation()) != null} etex;
shift2 := (0,-2u);

lab3u := btex Page Reload? etex;
lab3l := btex \texttt{contextHolder.getActiveDocumentLocation() == this.documentLocation} etex;
shift3 := (0,-4u);

lab4u := btex Force prevent reload? etex;
lab4l := btex \texttt{pagedResultDataModel.preventReload() == true} etex;
shift4 := (0,-6u);

lab5u := btex Use Cache etex;
lab5l := btex etex;
shift5 := (-3u, -8u);

lab6u := btex Reload Table etex;
lab6l := btex etex;
shift6 := (3u, -8u);

lab7u := btex Update Navigation Info etex;
lab7l := btex \vbox{
    \hbox{\texttt{pagedResultDataModel.setPreventReload(false)}}
    \hbox{\texttt{contextHolder.PagedResultDataModel(pagedResultDataModel)}}
    \hbox{\texttt{contextHolder.setActiveDocumentLocation(this.documentLocation)}}
    } etex;
shift7 := (0,-10u);

for i=2 upto 7:
    lab[i]u := lab[i]u shifted -center lab[i]u;
    lab[i]l := lab[i]l shifted -center lab[i]l;
    lab[i]l := lab[i]l shifted (0, -((ypart ulcorner bbox lab[i]l) - (ypart llcorner bbox lab[i]u)));

    if ((i < 5) or (i > 6)):
        p[i]u := (-node_width, ypart llcorner bbox lab[i]u) -- (node_width, ypart lrcorner bbox lab[i]u) -- 
            (node_width, ypart urcorner bbox lab[i]u) -- (-node_width, ypart ulcorner bbox lab[i]u) --cycle;

        p[i]l := (-node_width, ypart llcorner bbox lab[i]l) -- (node_width, ypart lrcorner bbox lab[i]l) -- 
            (node_width, ypart urcorner bbox lab[i]l) -- (-node_width, ypart ulcorner bbox lab[i]l) --cycle;

        p[i]u := rounded(p[i]u, 2mm, false);
        p[i]l := rounded(p[i]l, 2mm, true);
    else:
        p[i]u := elltemplate;
        p[i]l := p[i]u;
    fi;

    lab[i]l := lab[i]l shifted shift[i];
    lab[i]u := lab[i]u shifted shift[i];
    p[i]l := p[i]l shifted shift[i];
    p[i]u := p[i]u shifted shift[i];


    fill p[i]u withcolor clr0;
    fill p[i]l withcolor clr1;
    draw p[i]l;
    draw p[i]u;

    draw lab[i]u; 
    draw lab[i]l;

endfor;


%%%%%%%%%%%%%%% Arrows %%%%%%%%%%%%%%%

vardef round_corners (expr p, sc) =
    save a, b, d, q; 
    pair a[], b[], d[];
    path q;
    for i=0 upto length(p) - 1:
        a[i] := point i of p;
        b[i] := point (i+1) of p;
        d[i] := unitvector(b[i] - a[i]);
        a[i] := a[i] + sc*d[i];
        b[i] := b[i] - sc*d[i];
    endfor;
    q := point 0 of p for i=0 upto length(p) - 2: --b[i]{d[i]}..a[i+1]{d[i+1]} endfor -- point length(p) of p;
    q
enddef;

vardef rec_path(expr a, b, s) = 
    save p; path p;
    save ab; pair ab;
    ab := .5[a, b];
    if (s = "-|"):
        p := a -- (xpart b, ypart a) -- b;
    elseif (s = "|-"):
       p := a -- (xpart a, ypart b) -- b;
    elseif (s = "-|-"):
       p := a -- (xpart ab, ypart a) -- (xpart ab, ypart b) -- b;
    elseif (s = "|-|"):
       p := a -- (xpart a, ypart ab) -- (xpart b, ypart ab) -- b;
    fi; 
    round_corners(p, 4mm)
enddef; 

path arr[];
picture lab[];

%% arr0 := .5[llcorner p1l, lrcorner p1l] -- .5[ulcorner p2u, urcorner p2u];
arr1 := .5[llcorner p2l, lrcorner p2l] -- .5[ulcorner p3u, urcorner p3u];
arr2 := .5[llcorner p3l, lrcorner p3l] -- .5[ulcorner p4u, urcorner p4u];

arr3 := rec_path(.4[llcorner p4l, lrcorner p4l], point 2 of p5u, "|-|");
arr4 := rec_path(.6[llcorner p4l, lrcorner p4l], point 2 of p6u, "|-|");
arr5 := rec_path(.5[lrcorner p2u, urcorner p2l], point 1.25 of p6u, "-|");
arr6 := rec_path(.5[llcorner p3u, ulcorner p3l], point 2.75 of p5u, "-|");
arr7 := rec_path(point 6 of p5u, .4[ulcorner p7u, urcorner p7u], "|-|");
arr8 := rec_path(point 6 of p6u, .6[ulcorner p7u, urcorner p7u], "|-|");

lab1 := image(label(btex Yes etex, point .5*length(arr1) of arr1));
lab2 := image(label(btex Yes etex, point .5*length(arr2) of arr2));
lab3 := image(label(btex Yes etex, point .5*length(arr3) of arr3));
lab4 := image(label(btex No etex, point .5*length(arr4) of arr4));
lab5 := image(label(btex No etex, point .7*length(arr5) of arr5));
lab6 := image(label(btex No etex, point .7*length(arr6) of arr6));

for i=1 upto 8: 
    drawarrow arr[i];
endfor;

for i=1 upto 6: 
    fill bbox lab[i] withcolor white;
    draw bbox lab[i];
    draw lab[i];
endfor;


%%%%%%%%%%%%%%%%%%%%%%%%%%%

begingroup;
    
    save bboxmargin;
    bboxmargin := 6mm;

    node_width := 0.5*(xpart urcorner currentpicture - xpart ulcorner currentpicture) + 0.2u;

    lab0u := btex \texttt{AbstractDocumentBean.initializeDataModel()} etex scaled 1.3;
    lab0u := lab0u shifted -center lab0u;
    lab0l := currentpicture;
    currentpicture := nullpicture;
    lab0l := lab0l shifted -center lab0l;
    lab0l := lab0l shifted (0, -((ypart ulcorner bbox lab0l) - (ypart llcorner bbox lab0u)));

    p0u := rounded((-node_width, ypart llcorner bbox lab0u) -- (node_width, ypart lrcorner bbox lab0u) -- 
                (node_width, ypart urcorner bbox lab0u) -- (-node_width, ypart ulcorner bbox lab0u) --cycle, 2mm, false);

    p0l := rounded((-node_width, ypart llcorner bbox lab0l) -- (node_width, ypart lrcorner bbox lab0l) -- 
                (node_width, ypart urcorner bbox lab0l) -- (-node_width, ypart ulcorner bbox lab0l) --cycle, 2mm, true);


    fill p0u withcolor clr2;
    fill p0l withcolor clr3;
    draw p0l;
    draw p0u;
    draw lab0u withcolor clr1;
    draw lab0l;

endgroup;

%%%%%%%%%%%%%%%%%%%%%%%%%

node_width := 3u;

lab8u := btex Load Page etex;
lab8u := lab8u shifted -center lab8u;
lab8u := lab8u shifted (0, ypart llcorner currentpicture - ypart ulcorner lab8u -u);
z.l = .5[llcorner currentpicture, lrcorner currentpicture];

p8u := elltemplate shifted center lab8u;

fill p8u withcolor clr1;
draw p8u withpen ellpen;
draw lab8u;

arr0 := z.l -- .5[ulcorner p8u,urcorner p8u];
drawarrow arr0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%

picture cc; cc := currentpicture;

lab0u := btex Filter table etex;
lab1u := btex Page Reload etex;
lab0u := lab0u shifted -center lab0u shifted .5[ulcorner currentpicture, urcorner currentpicture] shifted (-3u,2u); 
lab1u := lab1u shifted -center lab1u shifted .5[ulcorner currentpicture, urcorner currentpicture] shifted (3u,2u);  

p0u := elltemplate shifted center lab0u;
p1u := elltemplate shifted center lab1u;

fill p0u withcolor clr1;
draw p0u withpen ellpen;
fill p1u withcolor clr1;
draw p1u withpen ellpen;
draw lab0u;
draw lab1u;

% arr0 := rec_path(point 6 of p0u, .3[ulcorner cc, urcorner cc], "|-|");
% arr1 := rec_path(point 6 of p1u, .7[ulcorner cc, urcorner cc], "|-|");
arr0 := point 6 of p0u -- .3[ulcorner cc, urcorner cc];
arr1 := point 6 of p1u -- .7[ulcorner cc, urcorner cc];

drawarrow arr0;
drawarrow arr1;

lab0u := btex Clear Table Cache etex;
lab1u := btex \texttt{@Postconstruct} etex;
lab0u := lab0u shifted -center lab0u shifted point .5 of arr0;
lab1u := lab1u shifted -center lab1u shifted point .5 of arr1;
fill bbox lab0u withcolor clr1;
fill bbox lab1u withcolor clr1;
draw bbox lab0u;
draw bbox lab1u;
draw lab0u;
draw lab1u;

bboxmargin := 4mm;
draw bbox currentpicture;


def getmid(suffix p) =
    pair p.mid[], p.off[], p.dir[];
    for i=0 upto 36:
    p.dir[i] = dir(5*i);
    p.mid[i]+p.off[i] = directionpoint p.dir[i] of p;
    p.mid[i]-p.off[i] = directionpoint -p.dir[i] of p;
endfor
enddef;

path qq;
qq := fullcircle scaled u;


getmid(qq);
show qq.dir1;

endfig;
end;