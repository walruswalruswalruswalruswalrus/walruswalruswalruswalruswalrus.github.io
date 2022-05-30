var ModAttachr;(function(ModAttachr_1){"use strict";var ModAttachr=(function(){function ModAttachr(settings){this.mods={};this.events={};if(!settings){return;}
this.scopeDefault=settings.scopeDefault;if(settings.ItemsHoldr){this.ItemsHolder=settings.ItemsHoldr;}
else if(settings.storeLocally){this.ItemsHolder=new ItemsHoldr.ItemsHoldr();}
if(settings.mods){this.addMods(settings.mods);}}
ModAttachr.prototype.getMods=function(){return this.mods;};ModAttachr.prototype.getMod=function(name){return this.mods[name];};ModAttachr.prototype.getEvents=function(){return this.events;};ModAttachr.prototype.getEvent=function(name){return this.events[name];};ModAttachr.prototype.getItemsHolder=function(){return this.ItemsHolder;};ModAttachr.prototype.addMod=function(mod){var modEvents=mod.events,name;for(name in modEvents){if(!modEvents.hasOwnProperty(name)){continue;}
if(!this.events.hasOwnProperty(name)){this.events[name]=[mod];}
else{this.events[name].push(mod);}}
mod.scope=mod.scope||this.scopeDefault;this.mods[mod.name]=mod;if(mod.enabled&&mod.events.hasOwnProperty("onModEnable")){this.fireModEvent("onModEnable",mod.name,arguments);}
if(this.ItemsHolder){this.ItemsHolder.addItem(mod.name,{"valueDefault":0,"storeLocally":true});if(this.ItemsHolder.getItem(mod.name)){this.enableMod(mod.name);}}};ModAttachr.prototype.addMods=function(mods){for(var i=0;i<mods.length;i+=1){this.addMod(mods[i]);}};ModAttachr.prototype.enableMod=function(name){var mod=this.mods[name],args;if(!mod){throw new Error("No mod of name: '"+name+"'");}
mod.enabled=true;args=Array.prototype.slice.call(arguments);args[0]=mod;if(this.ItemsHolder){this.ItemsHolder.setItem(name,true);}
if(mod.events.hasOwnProperty("onModEnable")){return this.fireModEvent("onModEnable",mod.name,arguments);}};ModAttachr.prototype.enableMods=function(){var names=[];for(var _i=0;_i<arguments.length;_i++){names[_i-0]=arguments[_i];}
names.forEach(this.enableMod.bind(this));};ModAttachr.prototype.disableMod=function(name){var mod=this.mods[name],args;if(!this.mods[name]){throw new Error("No mod of name: '"+name+"'");}
this.mods[name].enabled=false;args=Array.prototype.slice.call(arguments);args[0]=mod;if(this.ItemsHolder){this.ItemsHolder.setItem(name,false);}
if(mod.events.hasOwnProperty("onModDisable")){return this.fireModEvent("onModDisable",mod.name,args);}};ModAttachr.prototype.disableMods=function(){var names=[];for(var _i=0;_i<arguments.length;_i++){names[_i-0]=arguments[_i];}
names.forEach(this.disableMod.bind(this));};ModAttachr.prototype.toggleMod=function(name){var mod=this.mods[name];if(!mod){throw new Error("No mod found under "+name);}
if(mod.enabled){return this.disableMod(name);}
else{return this.enableMod(name);}};ModAttachr.prototype.toggleMods=function(){var names=[];for(var _i=0;_i<arguments.length;_i++){names[_i-0]=arguments[_i];}
names.forEach(this.toggleMod.bind(this));};ModAttachr.prototype.fireEvent=function(event){var extraArgs=[];for(var _i=1;_i<arguments.length;_i++){extraArgs[_i-1]=arguments[_i];}
var fires=this.events[event],args=Array.prototype.splice.call(arguments,0),mod,i;if(!fires){return;}
for(i=0;i<fires.length;i+=1){mod=fires[i];args[0]=mod;if(mod.enabled){mod.events[event].apply(mod.scope,args);}}};ModAttachr.prototype.fireModEvent=function(eventName,modName){var extraArgs=[];for(var _i=2;_i<arguments.length;_i++){extraArgs[_i-2]=arguments[_i];}
var mod=this.mods[modName],args=Array.prototype.slice.call(arguments,2),fires;if(!mod){throw new Error("Unknown mod requested: '"+modName+"'");}
args[0]=mod;fires=mod.events[eventName];if(!fires){throw new Error("Mod does not contain event: '"+eventName+"'");}
return fires.apply(mod.scope,args);};return ModAttachr;})();ModAttachr_1.ModAttachr=ModAttachr;})(ModAttachr||(ModAttachr={}));