var ChangeLinr;(function(ChangeLinr_1){"use strict";var ChangeLinr=(function(){function ChangeLinr(settings){var i;if(typeof settings.pipeline==="undefined"){throw new Error("No pipeline given to ChangeLinr.");}
this.pipeline=settings.pipeline||[];if(typeof settings.transforms==="undefined"){throw new Error("No transforms given to ChangeLinr.");}
this.transforms=settings.transforms||{};this.doMakeCache=typeof settings.doMakeCache==="undefined"?true:settings.doMakeCache;this.doUseCache=typeof settings.doUseCache==="undefined"?true:settings.doUseCache;this.cache={};this.cacheFull={};for(i=0;i<this.pipeline.length;++i){if(!this.pipeline[i]){throw new Error("Pipe["+i+"] is invalid.");}
if(!this.transforms.hasOwnProperty(this.pipeline[i])){if(!this.transforms.hasOwnProperty(this.pipeline[i])){throw new Error("Pipe["+i+"] (\""+this.pipeline[i]+"\") "
+"not found in transforms.");}}
if(!(this.transforms[this.pipeline[i]]instanceof Function)){throw new Error("Pipe["+i+"] (\""+this.pipeline[i]+"\") "
+"is not a valid Function from transforms.");}
this.cacheFull[i]=this.cacheFull[this.pipeline[i]]={};}}
ChangeLinr.prototype.getCache=function(){return this.cache;};ChangeLinr.prototype.getCached=function(key){return this.cache[key];};ChangeLinr.prototype.getCacheFull=function(){return this.cacheFull;};ChangeLinr.prototype.getDoMakeCache=function(){return this.doMakeCache;};ChangeLinr.prototype.getDoUseCache=function(){return this.doUseCache;};ChangeLinr.prototype.process=function(data,key,attributes){if(key===void 0){key=undefined;}
if(attributes===void 0){attributes=undefined;}
var i;if(typeof key==="undefined"&&(this.doMakeCache||this.doUseCache)){key=data;}
if(this.doUseCache&&this.cache.hasOwnProperty(key)){return this.cache[key];}
for(i=0;i<this.pipeline.length;++i){data=this.transforms[this.pipeline[i]](data,key,attributes,this);if(this.doMakeCache){this.cacheFull[this.pipeline[i]][key]=data;}}
if(this.doMakeCache){this.cache[key]=data;}
return data;};ChangeLinr.prototype.processFull=function(raw,key,attributes){if(attributes===void 0){attributes=undefined;}
var output={},i;this.process(raw,key,attributes);for(i=0;i<this.pipeline.length;++i){output[i]=output[this.pipeline[i]]=this.cacheFull[this.pipeline[i]][key];}
return output;};return ChangeLinr;})();ChangeLinr_1.ChangeLinr=ChangeLinr;})(ChangeLinr||(ChangeLinr={}));