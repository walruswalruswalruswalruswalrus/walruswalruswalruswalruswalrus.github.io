var FPSAnalyzr;(function(FPSAnalyzr_1){"use strict";var FPSAnalyzr=(function(){function FPSAnalyzr(settings){if(settings===void 0){settings={};}
this.maxKept=settings.maxKept||35;this.numRecorded=0;this.ticker=-1;this.measurements=isFinite(this.maxKept)?new Array(this.maxKept):{};if(typeof settings.getTimestamp==="undefined"){if(typeof performance==="undefined"){this.getTimestamp=function(){return Date.now();};}
else{this.getTimestamp=(performance.now||performance.webkitNow||performance.mozNow||performance.msNow||performance.oNow).bind(performance);}}
else{this.getTimestamp=settings.getTimestamp;}}
FPSAnalyzr.prototype.measure=function(time){if(time===void 0){time=this.getTimestamp();}
if(this.timeCurrent){this.addFPS(1000/(time-this.timeCurrent));}
this.timeCurrent=time;};FPSAnalyzr.prototype.addFPS=function(fps){this.ticker=(this.ticker+=1)%this.maxKept;this.measurements[this.ticker]=fps;this.numRecorded+=1;};FPSAnalyzr.prototype.getMaxKept=function(){return this.maxKept;};FPSAnalyzr.prototype.getNumRecorded=function(){return this.numRecorded;};FPSAnalyzr.prototype.getTimeCurrent=function(){return this.timeCurrent;};FPSAnalyzr.prototype.getTicker=function(){return this.ticker;};FPSAnalyzr.prototype.getMeasurements=function(){var fpsKeptReal=Math.min(this.maxKept,this.numRecorded),copy,i;if(isFinite(this.maxKept)){copy=new Array(fpsKeptReal);}
else{copy={};copy.length=fpsKeptReal;}
for(i=fpsKeptReal-1;i>=0;--i){copy[i]=this.measurements[i];}
return copy;};FPSAnalyzr.prototype.getDifferences=function(){var copy=this.getMeasurements(),i;for(i=copy.length-1;i>=0;--i){copy[i]=1000/copy[i];}
return copy;};FPSAnalyzr.prototype.getAverage=function(){var total=0,max=Math.min(this.maxKept,this.numRecorded),i;for(i=max-1;i>=0;--i){total+=this.measurements[i];}
return total/max;};FPSAnalyzr.prototype.getMedian=function(){var copy=this.getMeasurementsSorted(),fpsKeptReal=copy.length,fpsKeptHalf=Math.floor(fpsKeptReal/2);if(copy.length%2===0){return copy[fpsKeptHalf];}
else{return(copy[fpsKeptHalf-2]+copy[fpsKeptHalf])/2;}};FPSAnalyzr.prototype.getExtremes=function(){var lowest=this.measurements[0],highest=lowest,max=Math.min(this.maxKept,this.numRecorded),fps,i;for(i=max-1;i>=0;--i){fps=this.measurements[i];if(fps>highest){highest=fps;}
else if(fps<lowest){lowest=fps;}}
return[lowest,highest];};FPSAnalyzr.prototype.getRange=function(){var extremes=this.getExtremes();return extremes[1]-extremes[0];};FPSAnalyzr.prototype.getMeasurementsSorted=function(){var copy,i;if(this.measurements.constructor===Array){copy=this.measurements.sort();}
else{copy=[];for(i in this.measurements){if(this.measurements.hasOwnProperty(i)){if(this.measurements[i]===undefined){break;}
copy[i]=this.measurements[i];}}
copy.sort();}
if(this.numRecorded<this.maxKept){copy.length=this.numRecorded;}
return copy.sort();};return FPSAnalyzr;})();FPSAnalyzr_1.FPSAnalyzr=FPSAnalyzr;})(FPSAnalyzr||(FPSAnalyzr={}));