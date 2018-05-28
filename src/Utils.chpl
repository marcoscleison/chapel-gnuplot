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

module Utils{
use Random;





proc reshape2DArray(X:[?D]?eltType, rows:int,cols:int){
    var sz=rows*cols;
    var arr:[1..rows,1..cols]eltType;
    var i:int=0;
    var j:int=0;
    
    while(i<rows){
        j=0;
        while(j<cols){
            var idx = rows*j+i+1;
            
            if(D.member(idx)){
               // writeln("i=",i, " j= ",j, " idx= ",idx," X[idx] = ",X[idx]);
                arr[i+1,j+1]=X[idx];
            }
            j+=1;
        }
        i+=1;
    }
    
    
    return arr;
    
}

proc array2DToCsv(X:[?D]?eltType){
    var rows:int = D.dim(1).size;
    var cols:int = D.dim(2).size;
    var str="";
    var i:int=1,j:int=1;

    while(i<=rows){
        j=1;
        while(j<=cols){
            if(D.member((i,j))){
                if(j==cols){
                    str += X[i,j]:string+"\n";
                }else{
                    str += X[i,j]:string+", ";
                }

            }

            j+=1;
        }
        i+=1;
    }

    return str;
}

proc arraysToCSV(X...?n){
    var DX = X[1].domain;
    var str ="";
    for idx in DX{
      for dix in 1..n{
        var XV =X[dix];
        if(dix==n){
            str+= XV[idx]:string+"\n";
        }else{
            str+= XV[idx]:string+", ";
        } 
      } 
    }
    return str;
}

 proc randomString(size:int, dicts:string="01234567890abcdefghijklmnopqrstuwvxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"){

    var randStream:RandomStream(real) = new RandomStream(real);
    var str:string;
    var i=1;
    while (i<=size ) {
        var nextRand = randStream.getNext();
        var idx = (nextRand*(dicts.length-1)+1):int;
        str += dicts[idx];
         i+=1;
    }
    return str;
 }

}