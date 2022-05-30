var StringFilr;(function(StringFilr_1){"use strict";var StringFilr=(function(){function StringFilr(settings){if(!settings){throw new Error("No settings given to StringFilr.");}
if(!settings.library){throw new Error("No library given to StringFilr.");}
this.library=settings.library;this.normal=settings.normal;this.requireNormalKey=settings.requireNormalKey;this.cache={};if(this.requireNormalKey){if(typeof this.normal==="undefined"){throw new Error("StringFilr is given requireNormalKey, but no normal class.");}
this.ensureLibraryNormal();}}
StringFilr.prototype.getLibrary=function(){return this.library;};StringFilr.prototype.getNormal=function(){return this.normal;};StringFilr.prototype.getCache=function(){return this.cache;};StringFilr.prototype.getCached=function(key){return this.cache[key];};StringFilr.prototype.clearCache=function(){this.cache={};};StringFilr.prototype.clearCached=function(key){delete this.cache[key];if(this.normal){delete this.cache[key.replace(this.normal,"")];}};StringFilr.prototype.get=function(keyRaw){var key,result;if(this.normal){key=keyRaw.replace(this.normal,"");}
else{key=keyRaw;}
if(this.cache.hasOwnProperty(key)){return this.cache[key];}
result=this.followClass(key.split(/\s+/g),this.library);this.cache[key]=this.cache[keyRaw]=result;return result;};StringFilr.prototype.findLackingNormal=function(current,path,output){var i;if(!current.hasOwnProperty(this.normal)){output.push(path);}
if(typeof current[i]==="object"){for(i in current){if(current.hasOwnProperty(i)){this.findLackingNormal(current[i],path+" "+i,output);}}}
return output;};StringFilr.prototype.followClass=function(keys,current){var key,i;if(!keys||!keys.length){return current;}
for(i=0;i<keys.length;i+=1){key=keys[i];if(current.hasOwnProperty(key)){keys.splice(i,1);return this.followClass(keys,current[key]);}}
if(this.normal&&current.hasOwnProperty(this.normal)){return this.followClass(keys,current[this.normal]);}
return current;};StringFilr.prototype.ensureLibraryNormal=function(){var caught=this.findLackingNormal(this.library,"base",[]);if(caught.length){throw new Error("Found "+caught.length+" library "
+"sub-directories missing the normal: "
+"\r\n  "+caught.join("\r\n  "));}};return StringFilr;})();StringFilr_1.StringFilr=StringFilr;})(StringFilr||(StringFilr={}));