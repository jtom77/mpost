verbatimtex
%&latex
\documentclass{article}
\usepackage{listings}
\begin{document}
etex


input rboxes;


beginfig(1)

rbox_radius := 4bp;

bboxmargin:=0.2cm;

numeric u; u=2.2cm;
v=1.2cm;

color clr.upper, clr.lower;
clr.upper:=0.8red;
clr.lower:=0.8white;

node_width=6cm;

vardef drawclrbox@#(text t)=         % Draw each box
  fixsize(t); fixpos(t);
  forsuffixes s=t: fill bpath.s withcolor clr.@#; draw pic_mac_.s; endfor
enddef;

vardef node@#(expr up, low) = 
    save p_; picture p_;
    boxit.@#.upper(up);
    boxit.@#.lower(low);
    @#.lower.dx=node_width-.5(xpart urcorner pic_@#.lower - xpart ulcorner pic_@#.lower);
    @#.upper.dx=node_width-.5(xpart urcorner pic_@#.upper - xpart ulcorner pic_@#.upper);
    @#.lower.n=@#.upper.s;
    p_:=image(
        drawclrbox.upper(@#.upper);
        drawclrbox.lower(@#.lower);
    );
    rboxit.@#(p_);
enddef;

rboxit.aa(btex \texttt{AbstractDocumentBean.initializeDataModel()} etex);
node.bb(btex Cached Data available? etex, btex \texttt{contextHolder.getPagedResultList(getDocumentLocation()) != null} etex);
node.cc(btex Page Reload? etex, btex \texttt{contextHolder.getActiveDocumentLocation() == this.documentLocation} etex);
node.dd(btex Force prevent reload? etex, btex \texttt{pagedResultDataModel.preventReload() == true} etex);
rboxit.ee(btex Use Cache etex);
rboxit.ff(btex Reload Table etex);
node.gg(
    btex Update Navigation Info etex,
    btex \vbox{
        \hbox{\texttt{pagedResultDataModel.setPreventReload(false)}}
        \hbox{\texttt{contextHolder.PagedResultDataModel(pagedResultDataModel)}}
        \hbox{\texttt{contextHolder.setActiveDocumentLocation(this.documentLocation)}}
        } etex
);

bb.n=aa.s shifted (0,-v);
cc.n=bb.s shifted (0,-v);
dd.n=cc.s shifted (0,-v);
ee.n=dd.sw shifted (-v,-v);
ff.n=dd.se shifted (v,-v);
gg.n=.5[ee.s,ff.s] shifted (0,-v);

drawboxed(aa, bb, cc, dd, ee, ff, gg);


drawarrow aa.s--bb.n;
drawarrow bb.s--cc.n;
drawarrow cc.s--dd.n;
drawarrow dd.s--ee.n;
drawarrow dd.s--ff.n;
drawarrow ee.s--gg.n;
drawarrow ff.s--gg.n;


%%%%%%%%%%%

picture cur_; cur_:=currentpicture; currentpicture:=nullpicture;

node_width:=10cm;
clr.upper:=0.8blue;
clr.lower:=white;



node.fin(btex \texttt{AbstractDocumentBean.initializeDataModel()} etex, cur_);

drawboxed(fin);




endfig;
end;