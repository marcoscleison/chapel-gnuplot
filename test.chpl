module Main{

use GnuPlot;

use Utils;


proc main(){

    try!{
        var plt =CreateGnuPlot();
        var x = [1,2,3,4];        
        var y = x*x;
        var y2 = x*x-x;
       
        plt.setXrange("[-1:19]");// Api of gnuplot to set range
        plt.setYrange("[0:20]");// Api of gnuplot to set range
        //Sets the plot style - Optional
        plt.setPlotStyle("with circles lc rgb 'blue' ","w circles lc rgb 'red' fs solid 1.0 border lt -1"); //Set the style for
        //Sets the plot legend - Optional
        plt.legends("Epochs","Accuracy");
        plt.plot(x,y,x,y2); 
        plt.run();
    }
}


}