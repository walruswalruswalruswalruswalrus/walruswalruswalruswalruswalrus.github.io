var AudioPlayr;(function(AudioPlayr_1){"use strict";var AudioPlayr=(function(){function AudioPlayr(settings){var volumeInitial;if(typeof settings.library==="undefined"){throw new Error("No library given to AudioPlayr.");}
if(typeof settings.directory==="undefined"){throw new Error("No directory given to AudioPlayr.");}
if(typeof settings.fileTypes==="undefined"){throw new Error("No fileTypes given to AudioPlayr.");}
if(!settings.ItemsHolder){throw new Error("No ItemsHoldr given to AudioPlayr.");}
this.ItemsHolder=settings.ItemsHolder;this.library=settings.library;this.directory=settings.directory;this.fileTypes=settings.fileTypes;this.getThemeDefault=settings.getThemeDefault||"Theme";this.getVolumeLocal=typeof settings.getVolumeLocal==="undefined"?1:settings.getVolumeLocal;this.sounds={};this.libraryLoad();volumeInitial=this.ItemsHolder.getItem("volume");if(volumeInitial===undefined){this.setVolume(1);}
else{this.setVolume(this.ItemsHolder.getItem("volume"));}
this.setMuted(this.ItemsHolder.getItem("muted")||false);}
AudioPlayr.prototype.getLibrary=function(){return this.library;};AudioPlayr.prototype.getFileTypes=function(){return this.fileTypes;};AudioPlayr.prototype.getSounds=function(){return this.sounds;};AudioPlayr.prototype.getTheme=function(){return this.theme;};AudioPlayr.prototype.getThemeName=function(){return this.themeName;};AudioPlayr.prototype.getDirectory=function(){return this.directory;};AudioPlayr.prototype.getVolume=function(){return Number(this.ItemsHolder.getItem("volume")||0);};AudioPlayr.prototype.setVolume=function(volume){var i;if(!this.getMuted()){for(i in this.sounds){if(this.sounds.hasOwnProperty(i)){this.sounds[i].volume=Number(this.sounds[i].getAttribute("volumeReal"))*volume;}}}
this.ItemsHolder.setItem("volume",volume.toString());};AudioPlayr.prototype.getMuted=function(){return Boolean(Number(this.ItemsHolder.getItem("muted")));};AudioPlayr.prototype.setMuted=function(muted){this.getMuted()?this.setMutedOn():this.setMutedOff();};AudioPlayr.prototype.toggleMuted=function(){this.setMuted(!this.getMuted());};AudioPlayr.prototype.setMutedOn=function(){var i;for(i in this.sounds){if(this.sounds.hasOwnProperty(i)){this.sounds[i].volume=0;}}
this.ItemsHolder.setItem("muted","1");};AudioPlayr.prototype.setMutedOff=function(){var volume=this.getVolume(),sound,i;for(i in this.sounds){if(this.sounds.hasOwnProperty(i)){sound=this.sounds[i];sound.volume=Number(sound.getAttribute("volumeReal"))*volume;}}
this.ItemsHolder.setItem("muted","0");};AudioPlayr.prototype.getGetVolumeLocal=function(){return this.getVolumeLocal;};AudioPlayr.prototype.setGetVolumeLocal=function(getVolumeLocalNew){this.getVolumeLocal=getVolumeLocalNew;};AudioPlayr.prototype.getGetThemeDefault=function(){return this.getThemeDefault;};AudioPlayr.prototype.setGetThemeDefault=function(getThemeDefaultNew){this.getThemeDefault=getThemeDefaultNew;};AudioPlayr.prototype.play=function(name){var sound,used;if(!this.sounds.hasOwnProperty(name)){if(!this.library.hasOwnProperty(name)){throw new Error("Unknown name given to AudioPlayr.play: '"+name+"'.");}
sound=this.sounds[name]=this.library[name];}
else{sound=this.sounds[name];}
this.soundStop(sound);if(this.getMuted()){sound.volume=0;}
else{sound.setAttribute("volumeReal","1");sound.volume=this.getVolume();}
this.playSound(sound);used=Number(sound.getAttribute("used"));if(!used){sound.setAttribute("used",String(used+1));sound.addEventListener("ended",this.soundFinish.bind(this,name));}
sound.setAttribute("name",name);return sound;};AudioPlayr.prototype.pauseAll=function(){var i;for(i in this.sounds){if(this.sounds.hasOwnProperty(i)){this.pauseSound(this.sounds[i]);}}};AudioPlayr.prototype.resumeAll=function(){var i;for(i in this.sounds){if(!this.sounds.hasOwnProperty(i)){continue;}
this.playSound(this.sounds[i]);}};AudioPlayr.prototype.pauseTheme=function(){if(this.theme){this.pauseSound(this.theme);}};AudioPlayr.prototype.resumeTheme=function(){if(this.theme){this.playSound(this.theme);}};AudioPlayr.prototype.clearAll=function(){this.pauseAll();this.clearTheme();this.sounds={};};AudioPlayr.prototype.clearTheme=function(){if(!this.theme){return;}
this.pauseTheme();delete this.sounds[this.theme.getAttribute("name")];this.theme=undefined;this.themeName=undefined;};AudioPlayr.prototype.playLocal=function(name,location){if(location===void 0){location=undefined;}
var sound=this.play(name),volumeReal;switch(this.getVolumeLocal.constructor){case Function:volumeReal=this.getVolumeLocal(location);break;case Number:volumeReal=this.getVolumeLocal;break;default:volumeReal=Number(this.getVolumeLocal)||1;break;}
sound.setAttribute("volumeReal",String(volumeReal));if(this.getMuted()){sound.volume=0;}
else{sound.volume=volumeReal*this.getVolume();}
return sound;};AudioPlayr.prototype.playTheme=function(name,loop){if(name===void 0){name=undefined;}
if(loop===void 0){loop=undefined;}
this.pauseTheme();loop=typeof loop!=="undefined"?loop:true;if(typeof(name)==="undefined"){switch(this.getThemeDefault.constructor){case Function:name=this.getThemeDefault();break;default:name=this.getThemeDefault;break;}}
if(typeof this.theme!=="undefined"&&this.theme.hasAttribute("name")){delete this.sounds[this.theme.getAttribute("name")];}
this.themeName=name;this.theme=this.sounds[name]=this.play(name);this.theme.loop=loop;if(this.theme.getAttribute("used")==="1"){this.theme.addEventListener("ended",this.playTheme.bind(this));}
return this.theme;};AudioPlayr.prototype.playThemePrefixed=function(prefix,name,loop){if(prefix===void 0){prefix=undefined;}
if(name===void 0){name=undefined;}
if(loop===void 0){loop=undefined;}
var sound=this.play(prefix);this.pauseTheme();if(typeof(name)==="undefined"){switch(this.getThemeDefault.constructor){case Function:name=this.getThemeDefault();break;default:name=this.getThemeDefault;break;}}
this.addEventListener(prefix,"ended",this.playTheme.bind(this,prefix+" "+name,loop));return sound;};AudioPlayr.prototype.addEventListener=function(name,event,callback){var sound=this.library[name];if(!sound){throw new Error("Unknown name given to addEventListener: '"+name+"'.");}
if(!sound.addedEvents){sound.addedEvents={};}
if(!sound.addedEvents[event]){sound.addedEvents[event]=[callback];}
else{sound.addedEvents[event].push(callback);}
sound.addEventListener(event,callback);};AudioPlayr.prototype.removeEventListeners=function(name,event){var sound=this.library[name],events,i;if(!sound){throw new Error("Unknown name given to removeEventListeners: '"+name+"'.");}
if(!sound.addedEvents){return;}
events=sound.addedEvents[event];if(!events){return;}
for(i=0;i<events.length;i+=1){sound.removeEventListener(event,events[i]);}
events.length=0;};AudioPlayr.prototype.addEventImmediate=function(name,event,callback){if(!this.sounds.hasOwnProperty(name)||this.sounds[name].paused){callback();return;}
this.sounds[name].addEventListener(event,callback);};AudioPlayr.prototype.soundFinish=function(name){if(this.sounds.hasOwnProperty(name)){delete this.sounds[name];}};AudioPlayr.prototype.soundStop=function(sound){this.pauseSound(sound);if(sound.readyState){sound.currentTime=0;}};AudioPlayr.prototype.libraryLoad=function(){var section,name,sectionName,j;for(sectionName in this.library){if(!this.library.hasOwnProperty(sectionName)){continue;}
section=this.library[sectionName];for(j in section){if(!section.hasOwnProperty(j)){continue;}
name=section[j];this.library[name]=this.createAudio(name,sectionName);}}};AudioPlayr.prototype.createAudio=function(name,sectionName){var sound=document.createElement("audio"),sourceType,child,i;for(i=0;i<this.fileTypes.length;i+=1){sourceType=this.fileTypes[i];child=document.createElement("source");child.type="audio/"+sourceType;child.src=this.directory+"/"+sectionName+"/"+sourceType+"/"+name+"."+sourceType;sound.appendChild(child);}
sound.volume=0;sound.setAttribute("volumeReal","1");sound.setAttribute("used","0");this.playSound(sound);return sound;};AudioPlayr.prototype.playSound=function(sound){if(sound&&sound.play){sound.play();return true;}
return false;};AudioPlayr.prototype.pauseSound=function(sound){if(sound&&sound.pause){sound.pause();return true;}
return false;};return AudioPlayr;})();AudioPlayr_1.AudioPlayr=AudioPlayr;})(AudioPlayr||(AudioPlayr={}));