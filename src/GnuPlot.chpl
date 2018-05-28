/*
 * Copyright (C) 2018 Marcos Cleison Silva Santana
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

module GnuPlot{
   use Spawn;
   use SysError;
   use IO;
   use Path;
   use Utils;
   use FileSystem;
   

class Plot{
  var gnuplot:GnuPlot;
  
  proc init(){
    this.gnuplot = CreateGnuPlot();
  }
  proc print(args...?n) {
     
     for param i in 1..n {
      if i != n then
       write(args(i), " ");
     else
       writeln(args(i));
   }
 }





}


    class GnuPlot{

var sub;
var nterm:int;
var typeTerm:string;
var stdout_:bool=true;

var tmpFileDomain:domain(1);
var tmpFiles:[tmpFileDomain]string;
var legendTitles:[1..0]string;
var plotStyles:[1..0]string;
/*proc GnuPlot(sub){

    this.nterm=0;gnuplot
    

}
*/
proc cmd(args ...?n){
    try!{
      if(this.stdout_){
        this.sub.stdin.write(_getProcessArguments((...args)));
      }else{
         write(_getProcessArguments((...args)));
      }
    }
    return this;

}

proc run(){
    
    try!{
    this.sub.communicate();
    begin this.sub.stdin.close();
    for f in this.tmpFiles{
      remove(f);
    }

    return this;
    }
    return this;

}

proc set(args...?n){

    this.cmd("set ",(...args));
    return this;

}

proc setTerminal(type_term:string="wxt",nterm:int=0){
    
    this.nterm = nterm;
    this.typeTerm = type_term;
    this.cmd("set terminal ", this.typeTerm, this.nterm,"\n");

    return this;
}

proc setAngleRadians(){
    this.cmd("set terminal radians","\n");
    return this;
}

proc setAngleDegree(){
    this.cmd("set terminal degrees","\n");
    return this;
}

proc setArrow(args...?n){
  
    this.cmd("set arrow", _getProcessArguments((...args)),"\n");

    return this;
}

proc setAutoscale(args...?n){
  
    this.cmd("set autoscale", _getProcessArguments((...args)),"\n");

    return this;
}
proc setBars(args...?n){
  
    this.cmd("set bars", _getProcessArguments((...args)),"\n");

    return this;
}

proc setBmargin(args...?n){
  
    this.cmd("set bmargin", _getProcessArguments((...args)),"\n");

    return this;
}
proc setMargin(args...?n){
  
    this.cmd("set margin", _getProcessArguments((...args)),"\n");

    return this;
}
proc setBorder(args...?n){
  
    this.cmd("set border", _getProcessArguments((...args)),"\n");

    return this;
}
proc setBoxwidth(args...?n){
  
    this.cmd("set boxwidth", _getProcessArguments((...args)),"\n");

    return this;
}
proc setClabel(args...?n){
  
    this.cmd("set clabel", _getProcessArguments((...args)),"\n");

    return this;
}
proc setClip(args...?n){
  
    this.cmd("set clip", _getProcessArguments((...args)),"\n");

    return this;
}
 proc setCntrparam(args...?n){
  
    this.cmd("set cntrparam", _getProcessArguments((...args)),"\n");

    return this;
}
proc setColorbox(args...?n){
  
    this.cmd("set colorbox", _getProcessArguments((...args)),"\n");

    return this;
}

proc setContour(args...?n){
  
    this.cmd("set contour", _getProcessArguments((...args)),"\n");

    return this;
}

proc setDatafile(args...?n){
  
    this.cmd("set datafile", _getProcessArguments((...args)),"\n");

    return this;
}

proc setDecimalsign(args...?n){
  
    this.cmd("set decimalsign", _getProcessArguments((...args)),"\n");

    return this;
}

proc setDgrid3d(args...?n){
  
    this.cmd("set dgrid3d", _getProcessArguments((...args)),"\n");

    return this;
}
proc setDummy(args...?n){
  
    this.cmd("set dummy", _getProcessArguments((...args)),"\n");

    return this;
}
proc setEncoding(args...?n){
  
    this.cmd("set encoding", _getProcessArguments((...args)),"\n");

    return this;
}
 proc setFit(args...?n){
  
    this.cmd("set fit", _getProcessArguments((...args)),"\n");

    return this;
}
proc setFontpath(args...?n){
  
    this.cmd("set fontpath", _getProcessArguments((...args)),"\n");

    return this;
}
proc setFormat(args...?n){
  
    this.cmd("set format", _getProcessArguments((...args)),"\n");

    return this;
}
proc setGrid(args...?n){
  
    this.cmd("set grid", _getProcessArguments((...args)),"\n");

    return this;
}
proc setHidden3d(args...?n){
  
    this.cmd("set hidden3d", _getProcessArguments((...args)),"\n");

    return this;
}
proc setHistorysize(args...?n){
  
    this.cmd("set historysize", _getProcessArguments((...args)),"\n");

    return this;
}
proc setIsosamples(args...?n){
  
    this.cmd("set isosamples", _getProcessArguments((...args)),"\n");

    return this;
}
proc setKey(args...?n){
  
    this.cmd("set key", _getProcessArguments((...args)),"\n");

    return this;
}
proc setLabel(args...?n){
  
    this.cmd("set label", _getProcessArguments((...args)),"\n");

    return this;
}
proc setLinetype(args...?n){
  
    this.cmd("set linetype", _getProcessArguments((...args)),"\n");

    return this;
}

proc setLmargin(args...?n){
  
    this.cmd("set lmargin", _getProcessArguments((...args)),"\n");

    return this;
}

proc setLoadpath(args...?n){
  
    this.cmd("set loadpath", _getProcessArguments((...args)),"\n");

    return this;
}
proc setLocale(args...?n){
  
    this.cmd("set locale", _getProcessArguments((...args)),"\n");

    return this;
}
proc setLogscale(args...?n){
  
    this.cmd("set logscale", _getProcessArguments((...args)),"\n");

    return this;
}

proc setMacros(args...?n){
  
    this.cmd("set macros", _getProcessArguments((...args)),"\n");

    return this;
}

proc setMapping(args...?n){
  
    this.cmd("set mapping", _getProcessArguments((...args)),"\n");

    return this;
}

proc setMouse(args...?n){
  
    this.cmd("set mouse", _getProcessArguments((...args)),"\n");

    return this;
}
proc setMultiplot(args...?n){
  
    this.cmd("set multiplot", _getProcessArguments((...args)),"\n");

    return this;
}
proc setMx2tics(args...?n){
  this.cmd("set mx2tics", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setMxtics(args...?n){
  this.cmd("set mxtics", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setMy2tics(args...?n){
  this.cmd("set my2tics", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setMytics(args...?n){
  this.cmd("set mytics", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setMztics(args...?n){
  this.cmd("set mztics", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setObject(args...?n){
  this.cmd("set object", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setOffsets(args...?n){
  this.cmd("set offsets", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setOrigin(args...?n){
  this.cmd("set origin", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setOutput(args...?n){
  this.cmd("set output", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setParametric(args...?n){
  this.cmd("set parametric", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setPm3d(args...?n){
  this.cmd("set pm3d", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setPalette(args...?n){
  this.cmd("set palette", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setPointsize(args...?n){
  this.cmd("set pointsize", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setPolar(args...?n){
  this.cmd("set polar", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setPrint(args...?n){
  this.cmd("set print", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setPsdir(args...?n){
  this.cmd("set psdir", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setRaxis(args...?n){
  this.cmd("set raxis", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setRmargin(args...?n){
  this.cmd("set rmargin", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setRrange(args...?n){
  this.cmd("set rrange", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setRtics(args...?n){
  this.cmd("set rtics", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setSamples(args...?n){
  this.cmd("set samples", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setSize(args...?n){
  this.cmd("set size", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setStyle(args...?n){
  this.cmd("set style", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setSurface(args...?n){
  this.cmd("set surface", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setTable(args...?n){
  this.cmd("set table", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setTermoption(args...?n){
  this.cmd("set termoption", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setTics(args...?n){
  this.cmd("set tics", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setTicslevel(args...?n){
  this.cmd("set ticslevel", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setTicscale(args...?n){
  this.cmd("set ticscale", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setTimestamp(args...?n){
  this.cmd("set timestamp", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setTimefmt(args...?n){
  this.cmd("set timefmt", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setTitle(args...?n){
  this.cmd("set title", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setTmargin(args...?n){
  this.cmd("set tmargin", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setTrange(args...?n){
  this.cmd("set trange", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setUrange(args...?n){
  this.cmd("set urange", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setView(args...?n){
  this.cmd("set view", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setVrange(args...?n){
  this.cmd("set vrange", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setX2data(args...?n){
  this.cmd("set x2data", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setX2dtics(args...?n){
  this.cmd("set x2dtics", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setX2label(args...?n){
  this.cmd("set x2label", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setX2range(args...?n){
  this.cmd("set x2range", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setX2tics(args...?n){
  this.cmd("set x2tics", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setX2zeroaxis(args...?n){
  this.cmd("set x2zeroaxis", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setXdata(args...?n){
  this.cmd("set xdata", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setXdtics(args...?n){
  this.cmd("set xdtics", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setXlabel(args...?n){
  this.cmd("set xlabel", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setXmtics(args...?n){
  this.cmd("set xmtics", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setXrange(args...?n){
  this.cmd("set xrange", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setXtics(args...?n){
  this.cmd("set xtics", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setXyplane(args...?n){
  this.cmd("set xyplane", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setXzeroaxis(args...?n){
  this.cmd("set xzeroaxis", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setY2data(args...?n){
  this.cmd("set y2data", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setY2dtics(args...?n){
  this.cmd("set y2dtics", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setY2mtics(args...?n){
  this.cmd("set y2mtics", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setY2range(args...?n){
  this.cmd("set y2range", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setY2tics(args...?n){
  this.cmd("set y2tics", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setY2zeroaxis(args...?n){
  this.cmd("set y2zeroaxis", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setYdata(args...?n){
  this.cmd("set ydata", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setYdtics(args...?n){
  this.cmd("set ydtics", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setYlabel(args...?n){
  this.cmd("set ylabel", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setYmtics(args...?n){
  this.cmd("set ymtics", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setYrange(args...?n){
  this.cmd("set yrange", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setYtics(args...?n){
  this.cmd("set ytics", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setYzeroaxis(args...?n){
  this.cmd("set yzeroaxis", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setZdata(args...?n){
  this.cmd("set zdata", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setZdtics(args...?n){
  this.cmd("set zdtics", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setZzeroaxis(args...?n){
  this.cmd("set zzeroaxis", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setCbdata(args...?n){
  this.cmd("set cbdata", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setCbdtics(args...?n){
  this.cmd("set cbdtics", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setZero(args...?n){
  this.cmd("set zero", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setZeroaxis(args...?n){
  this.cmd("set zeroaxis", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setZlabel(args...?n){
  this.cmd("set zlabel", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setZmtics(args...?n){
  this.cmd("set zmtics", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setZrange(args...?n){
  this.cmd("set zrange", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setZtics(args...?n){
  this.cmd("set ztics", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setCblabel(args...?n){
  this.cmd("set cblabel", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setCbmtics(args...?n){
  this.cmd("set cbmtics", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setCbrange(args...?n){
  this.cmd("set cbrange", _getProcessArguments((...args)),"\n");
 return this;
  }

proc setCbtics(args...?n){
  this.cmd("set cbtics", _getProcessArguments((...args)),"\n");
 return this;
  }

proc Writeln(args...?n) {
  try!{
    this.sub.stdin.writeln((...args));
  }
  
}

proc plotD(A:[?D]?eltType){

    this.cmd("plot '-' with lines\n","");
    this.Writeln(A);
    this.Writeln("e");
    return this;
}

proc plotXY(X:[?DX]?eltType,Y:[?DY]?eltType2){
    this.cmd("plot '-' with lines\n","");
    for idx in DX{
      this.Writeln(X[idx]," ",Y[idx]);
    }
    
    this.Writeln("e");
    return this;

}

proc legends(X...?n){
  this.legendTitles.domain.clear();
  for idx in 1..n{
    this.legendTitles.push_back(X[idx]);
  }
  return this;
}

proc setPlotStyle(X...?n){
 this.plotStyles.domain.clear();
  for idx in 1..n{
    this.plotStyles.push_back(X[idx]);
  }
  return this;
}

proc plot(X...?n){
  try!{
    type elType = X[1].eltType;
    var DX = X[1].domain;
    var rows = DX.dim(1).size;
    var cols:int = n; 
    
    var default_style = "with lines";
    var data:[1..0]elType;
    var style:[1..0]string;
    for dix in 1..n{
      var VX = X[dix];
          for x in VX{
            data.push_back(x);
          }
    }


   var filename = ".data_"+randomString(10)+".csv";
   var f =  open(filename, iomode.cwr);
   var wr =  f.writer();
   var data2d = reshape2DArray(data,rows,cols);
   var csv=array2DToCsv(data2d);

   wr.writeln(csv);
   wr.close();
   f.close();

   var cmds = "plot ";
   var current_style:string=default_style;
   var curr_legend:string;
   var col=1;
   

   while(col <=cols){
     if(this.legendTitles.domain.member(1+col/2)){
       curr_legend=" title '"+this.legendTitles[1+col/2]+"' ";
     }else{
       curr_legend="title 'Y"+col+"'";
     }
     
     if(this.plotStyles.domain.member(1+col/2)){
       current_style=this.plotStyles[1+col/2];
     }else{
       current_style = default_style;
     }

     if((col+1)==cols){   
        cmds += "'"+filename+"' using  "+col+":"+(col+1)+" "+current_style+" "+curr_legend+" ";
     }else{
       cmds += "'"+filename+"' using  "+col+":"+(col+1)+" "+current_style+" "+curr_legend+", ";
     }
      col+=2;
   }
    this.Writeln(cmds);
   //writeln("cols = ", cols," cmd =",cmds);
   this.tmpFiles.push_back(filename);
  }//try
    return this;

}


proc ImageMatrix(A:[?D]?eltType){

    /*
    set pm3d map

splot 'test.txt' matrix w image
    */
    this.setPm3d("map");
    this.cmd("set palette gray");

    this.cmd("splot '-' matrix with image\n");
    this.Writeln(A);
    this.Writeln("e");
    return this;
}

    }//gnuplot

proc _getProcessArguments(args ...?n){
  var str="";
  for param i in 1..n {
     str+=" ";
    str += args(i);
  }
	return str;
 }


proc CreateGnuPlot(){

     try{
        var sub = spawn(["gnuplot","-persistent"], stdin=PIPE, stdout=PIPE);
        return new GnuPlot(sub=sub);
     }catch e{
        writeln(e);
     }
      return nil;
   }

}


