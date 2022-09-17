verbatimtex
%&latex
\documentclass{article}
\usepackage{listings}
\begin{document}
etex

beginfig(1)

input macros;

upper := (1,0.5,0.5);
lower := (0,1,0.5);
clr := upper;

bboxmargin:=0.2cm;

numeric u; u=2cm;

numeric yshift; yshift=2u;
numeric xshift; xshift=3u;
numeric node_shift; node_shift=0.5u;
path p[], sq, c;


picture pic[];

pic0 = split_node(8u, 
    btex \texttt{AbstractDocumentBean.initializeDataModel()} etex, 
    btex  etex);

pic1 = split_node(6u, 
    btex Cached Data available? etex, 
    btex \texttt{contextHolder.getPagedResultList(getDocumentLocation()) != null} etex);

pic2 = split_node(6u, 
    btex Page Reload? etex, 
    btex \texttt{contextHolder.getActiveDocumentLocation() == this.documentLocation} etex);

pic3 = split_node(6u, 
    btex Force prevent reload? etex, 
    btex \texttt{pagedResultDataModel.preventReload() == true} etex);

begingroup;
    clr := white;
    pic4 := ell_node(3u, u, btex Use Cache etex);
    pic5 := ell_node(3u, u, btex Reload Table etex);
endgroup;

pic6 := split_node(6u,
    btex Update Navigation Info etex, 
    btex etex);

pic7 := split_node(6u, 
    btex Load Page etex, 
    btex asas etex);

pic8 := split_node(6u, 
    btex Load Page etex, 
    btex askjdhkash etex);

% draw pic0;

vardef below_of(expr a, b) =
    a shifted (0, -(ypart ulcorner bbox a) + (ypart llcorner bbox b) - node_shift)
enddef;


pic2 := below_of(pic2, pic1);
pic3 := below_of(pic3, pic2);
pic4 := below_of(pic4, pic3) shifted (-2u, 0);
pic5 := below_of(pic5, pic3) shifted (2u, 0);
pic6 := below_of(pic6, pic4);
pic7 := below_of(pic7, pic6);

draw pic1;
draw pic2;
draw pic3;
draw pic4;
draw pic5;
draw pic6;
draw pic7;

path arr[];
arr1 := .5[llcorner pic1, lrcorner pic1]--.5[ulcorner pic2, urcorner pic2];
arr2 := .5[llcorner pic2, lrcorner pic2]--.5[ulcorner pic3, urcorner pic3];
arr3 := .5[llcorner pic3, lrcorner pic3]--.5[ulcorner pic4, urcorner pic4];
arr4 := .5[llcorner pic3, lrcorner pic3]--.5[ulcorner pic5, urcorner pic5];
arr5 := .5[llcorner pic4, lrcorner pic4]--.5[ulcorner pic6, urcorner pic6];
arr6 := .5[llcorner pic5, lrcorner pic5]--.5[ulcorner pic6, urcorner pic6];
arr7 := .5[llcorner pic6, lrcorner pic6]--.5[ulcorner pic7, urcorner pic7];

arr8 := .5[lrcorner pic1, urcorner pic1]{right}..{left}.5[lrcorner pic5, urcorner pic5];
arr9 := .5[lrcorner pic2, urcorner pic2]{right}..{left}.5[lrcorner pic5, urcorner pic5];


picture st; st := image(
    drawarrow arr8;
    drawarrow arr9;
);


drawarrow (point 0.5 of bbox pic2) -- (point 2.5 of bbox pic3);

%draw pic8;

picture cc; cc := currentpicture; 
currentpicture := nullpicture;

draw split_node(8u, btex \texttt{AbstractDocumentBean.initializeDataModel()} etex, cc);


% draw node(12u, btex Test etex);

draw st;

endfig;
end;