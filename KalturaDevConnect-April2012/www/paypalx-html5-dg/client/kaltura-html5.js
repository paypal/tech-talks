'video audio source track'.replace(/\w+/g, function(n){ document.createElement(n); });
/**
* Kaltura HTML5 Library v1.6.9.6e 
* Library Page http://www.kaltura.org/project/HTML5_Video_Media_JavaScript_Library
* 
* Common configuration options see: 
* http://html5video.org/wiki/Kaltura_SaaS_FAQ
*
* Whats in this version of Kaltura HTML5
* http://html5video.org/wiki/Kaltura_HTML5_Release_Notes
* 
*/

window['SCRIPT_LOADER_URL']='http://cdnakmi.kaltura.org/apis/html5versions/1.6.9/ResourceLoader.php';window['KALTURA_LOADER_VERSION']='1.6.9.6e';window.kWidget={readyWidgets:{},readyCallbacks:[],embed:function(targetId,settings){window.checkForKDPCallback();if(typeof targetId==='object'){settings=targetId;if(!settings.targetId){console.log('Error: Missing target element Id');}
targetId=settings.targetId;}
if(settings.readyCallback){this.addReadyCallback(function(videoId){if(targetId==videoId){settings.readyCallback(videoId);}});}
kalturaIframeEmbed(targetId,settings);},outputFlashObject:function(targetId,settings){var elm=document.getElementById(targetId);if(elm&&elm.parentNode){var spanTarget=document.createElement("span");var pId=(settings.id)?settings.id:elm.id
var swfUrl=mw.getConfig('Kaltura.ServiceUrl')+'/index.php/kwidget/'+'/wid/'+settings.wid+'/uiconf_id/'+settings.uiconf_id;if(settings.entry_id){swfUrl+='/entry_id/'+settings.entry_id;}
if(settings.cache_st){swfUrl+='/cache_st/'+settings.cache_st;}
var width=(settings.width)?settings.width:(elm.width)?elm.width:(elm.style.width)?parseInt(elm.style.width):400;var height=(settings.height)?settings.height:(elm.height)?elm.height:(elm.style.height)?parseInt(elm.style.height):300;var flashvarValue=(settings.flashvars)?kFlashVarsToString(settings.flashvars):'&';var defaultParamSet={'allowFullScreen':'true','allowNetworking':'all','allowScriptAccess':'always','bgcolor':'#000000'}
var o='<object id="'+pId+'" '+'name="'+pId+'" ';if(window.ActiveXObject){o+='classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" ';}
o+='width="'+width+'" '+'height="'+height+'" '+'style="width:'+width+'px;height:'+height+'px;" '+'resource="'+swfUrl+'" '+'data="'+swfUrl+'" ';var p='<param name="flashVars" value="'+flashvarValue+'" /> '+'<param name="movie" value="'+swfUrl+'" />';for(var key in defaultParamSet){var value=(typeof settings[key]!='undefined')?settings[key]:defaultParamSet[key];o+=key+'="'+value+'" ';p+='<param name="'+key+'" value="'+value+'" />';}
var objectTag=o+' > '+p+'</object>';elm.parentNode.replaceChild(spanTarget,elm);spanTarget.innerHTML=objectTag;}},addReadyCallback:function(readyCallback){for(var wid in this.readyWidgets){if(document.getElementById(wid)){readyCallback(wid);}}
this.readyCallbacks.push(readyCallback);},globalJsReadyCallback:function(widgetId){while(this.readyCallbacks.length){this.readyCallbacks.shift()(widgetId);}
this.readyWidgets[widgetId]=true;},rewriteObjectTags:function(){kAddedScript=false;kCheckAddScript();},log:function(msg){if(typeof console!='undefined'&&console.log){console.log(msg);}},supportsHTML5:function(){var dummyvid=document.createElement("video");if(navigator.userAgent.indexOf('BlackBerry')!=-1){return false;}
if(dummyvid.canPlayType){return true;}
return false;},supportsFlash:function(){var version=this.getFlashVersion().split(',').shift();if(version<10){return false;}else{return true;}},getFlashVersion:function(){if(navigator.plugins&&navigator.plugins.length){try{if(navigator.mimeTypes["application/x-shockwave-flash"].enabledPlugin){return(navigator.plugins["Shockwave Flash 2.0"]||navigator.plugins["Shockwave Flash"]).description.replace(/\D+/g,",").match(/^,?(.+),?$/)[1];}}catch(e){}}
try{try{if(typeof ActiveXObject!='undefined'){var axo=new ActiveXObject('ShockwaveFlash.ShockwaveFlash.6');try{axo.AllowScriptAccess='always';}catch(e){return'6,0,0';}}}catch(e){}
return new ActiveXObject('ShockwaveFlash.ShockwaveFlash').GetVariable('$version').replace(/\D+/g,',').match(/^,?(.+),?$/)[1];}catch(e){}
return'0,0,0';},isIOS:function(){return((navigator.userAgent.indexOf('iPhone')!=-1)||(navigator.userAgent.indexOf('iPod')!=-1)||(navigator.userAgent.indexOf('iPad')!=-1));}};window.KWidget=window.kWidget;var logIfInIframe=(typeof preMwEmbedConfig!='undefined'&&preMwEmbedConfig['EmbedPlayer.IsIframeServer'])?' ( iframe ) ':'';kWidget.log('Kaltura HTML5 Version: '+KALTURA_LOADER_VERSION+logIfInIframe);if(!window['mw']){window['mw']={};}
window.restoreKalturaKDPCallback=function(){if(window.KalturaKDPCallbackReady){window.jsCallbackReady=window.KalturaKDPCallbackReady;window.KalturaKDPCallbackReady=null;if(window.KalturaKDPCallbackAlreadyCalled&&window.KalturaKDPCallbackAlreadyCalled.length){for(var i=0;i<window.KalturaKDPCallbackAlreadyCalled.length;i++){var playerId=window.KalturaKDPCallbackAlreadyCalled[i];window.jsCallbackReady(playerId);window.KWidget.globalJsReadyCallback(playerId);}}}};kOverideJsFlashEmbed();if(!window['preMwEmbedReady']){window.preMwEmbedReady=[];}
if(!window['preMwEmbedConfig']){window.preMwEmbedConfig={};}
if(!mw.setConfig){mw.setConfig=function(set,value){var valueQueue={};if(typeof value!='undefined'){window.preMwEmbedConfig[set]=value;}else if(typeof set=='object'){for(var i in set){window.preMwEmbedConfig[i]=set[i];}}};}
if(!mw.getConfig){mw.getConfig=function(key,defaultValue){if(typeof window.preMwEmbedConfig[key]=='undefined'){if(typeof defaultValue!='undefined'){return defaultValue;}
return null;}else{return window.preMwEmbedConfig[key];}};}
if(document.URL.indexOf('forceMobileHTML5')!==-1){mw.setConfig('forceMobileHTML5',true);}
if(!mw.versionIsAtLeast){mw.versionIsAtLeast=function(minVersion,clientVersion){var minVersionParts=minVersion.split('.');var clientVersionParts=clientVersion.split('.');for(var i=0;i<minVersionParts.length;i++){if(parseInt(clientVersionParts[i])>parseInt(minVersionParts[i])){return true;}
if(parseInt(clientVersionParts[i])<parseInt(minVersionParts[i])){return false;}}
return true;};}
if(!mw.ready){mw.ready=function(fn){window.preMwEmbedReady.push(fn);kAddReadyHook(function(){kAddScript();});};}
if(!mw.getConfig('EmbedPlayer.IsIframeServer')){mw.setConfig('EmbedPlayer.IframeParentUrl',document.URL);mw.setConfig('EmbedPlayer.IframeParentTitle',document.title);mw.setConfig('EmbedPlayer.IframeParentReferrer',document.referrer);}
function kDoIframeRewriteList(rewriteObjects){for(var i=0;i<rewriteObjects.length;i++){var settings=rewriteObjects[i].kEmbedSettings;settings.width=rewriteObjects[i].width;settings.height=rewriteObjects[i].height;if(!kWidget.supportsFlash()&&!kWidget.supportsHTML5()&&!mw.getConfig('Kaltura.ForceFlashOnDesktop')){kDirectDownloadFallback(rewriteObjects[i].id,rewriteObjects[i].kEmbedSettings);}else{kalturaIframeEmbed(rewriteObjects[i].id,rewriteObjects[i].kEmbedSettings);}}}
function kalturaIframeEmbed(replaceTargetId,kEmbedSettings){var elm=document.getElementById(replaceTargetId);if(!elm){return false;}
try{elm.innerHTML='';}catch(e){}
if(elm.getAttribute('name')=='kaltura_player_iframe_no_rewrite'){return;}
var uiconf_id=kEmbedSettings.uiconf_id;kEmbedSettings.isHTML5=kIsHTML5FallForward();if(uiconf_id&&window.kUserAgentPlayerRules&&kUserAgentPlayerRules[uiconf_id]){var playerAction=window.checkUserAgentPlayerRules(kUserAgentPlayerRules[uiconf_id]);switch(playerAction.mode){case'flash':if(!kIsHTML5FallForward()&&elm.nodeName.toLowerCase()=='object'){restoreKalturaKDPCallback();return;}
break;case'leadWithHTML5':kEmbedSettings.isHTML5=kWidget.supportsHTML5();break;case'forceMsg':var msg=playerAction.val;if(elm&&elm.parentNode){var divTarget=document.createElement("div");divTarget.innerHTML=unescape(msg);elm.parentNode.replaceChild(divTarget,elm);}
break;}
window.kUserAgentPlayerRules=false;window.kAddedScript=false;}
if(kEmbedSettings.isHTML5&&!mw.getConfig('EmbedPlayer.EnableIframeApi')||(window.jQuery&&!mw.versionIsAtLeast('1.3.2',jQuery.fn.jquery))){kWidget.log('Kaltura HTML5 works best with jQuery 1.3.2 or above');kIframeWithoutApi(replaceTargetId,kEmbedSettings);return;}
if(kEmbedSettings.isHTML5){kAddScript(function(){var width=(kEmbedSettings.width)?kEmbedSettings.width:(elm.width)?elm.width:(elm.style.width)?parseInt(elm.style.width):400;var height=(kEmbedSettings.height)?kEmbedSettings.height:(elm.height)?elm.height:(elm.style.height)?parseInt(elm.style.height):300;var sizeUnit=(typeof kEmbedSettings.width=='string'&&kEmbedSettings.width.indexOf("px")===-1)?'px':'';var targetCss={'width':width+sizeUnit,'height':height+sizeUnit};var additionalTargetCss=kGetAdditionalTargetCss();$j.extend(targetCss,additionalTargetCss);$j('#'+replaceTargetId).css(targetCss);$j('#'+replaceTargetId).kalturaIframePlayer(kEmbedSettings);});}else{restoreKalturaKDPCallback();kWidget.outputFlashObject(replaceTargetId,kEmbedSettings);}}
function kIframeWithoutApi(replaceTargetId,kEmbedSettings){var iframeSrc=SCRIPT_LOADER_URL.replace('ResourceLoader.php','mwEmbedFrame.php');iframeSrc+='?'+kEmbedSettingsToUrl(kEmbedSettings);if(mw.getConfig('Kaltura.AllowIframeRemoteService')&&(mw.getConfig("Kaltura.ServiceUrl").indexOf('kaltura.com')===-1&&mw.getConfig("Kaltura.ServiceUrl").indexOf('kaltura.org')===-1)){iframeSrc+=kServiceConfigToUrl();}
if(mw.getConfig('forceMobileHTML5')){iframeSrc+='&forceMobileHTML5=true';}
if(mw.getConfig(' ')){iframeSrc+=mw.getConfig('debug');}
iframeSrc+='&urid='+KALTURA_LOADER_VERSION;var targetNode=document.getElementById(replaceTargetId);var parentNode=targetNode.parentNode;var iframe=document.createElement('iframe');iframe.src=iframeSrc;iframe.id=replaceTargetId;iframe.width=(kEmbedSettings.width)?kEmbedSettings.width:'100%';iframe.height=(kEmbedSettings.height)?kEmbedSettings.height:'100%';iframe.style.border='0px';iframe.style.overflow='hidden';parentNode.replaceChild(iframe,targetNode);}
function kEmbedSettingsToUrl(kEmbedSettings){var url='';var kalturaAttributeList=['uiconf_id','entry_id','wid','p','cache_st'];for(var attrKey in kEmbedSettings){for(var i=0;i<kalturaAttributeList.length;i++){if(kalturaAttributeList[i]==attrKey){url+='&'+attrKey+'='+encodeURIComponent(kEmbedSettings[attrKey]);}}}
url+=kFlashVarsToUrl(kEmbedSettings.flashvars);return url;}
function kDirectDownloadFallback(replaceTargetId,kEmbedSettings,options){var targetNode=document.getElementById(replaceTargetId);if(!targetNode){kWidget.log("Error could not find object target: "+replaceTargetId);}
try{targetNode.innerHTML='';}catch(e){}
if(!options)
options={};if(!options.width&&kEmbedSettings.width)
options.width=kEmbedSettings.width;if(!options.height&&kEmbedSettings.height)
options.height=kEmbedSettings.height;if(!options.width&&targetNode.style.width)
options.width=targetNode.style.width;if(!options.height&&targetNode.style.height)
options.height=targetNode.style.height;if(!options.height)
options.height=300;if(!options.width)
options.width=400;var downloadUrl=SCRIPT_LOADER_URL.replace('ResourceLoader.php','modules/KalturaSupport/download.php')+'/wid/'+kEmbedSettings.wid;if(kEmbedSettings.uiconf_id){downloadUrl+='/uiconf_id/'+kEmbedSettings.uiconf_id;}
if(kEmbedSettings.entry_id){downloadUrl+='/entry_id/'+kEmbedSettings.entry_id;}
var thumbSrc=mw.getKalturaThumbUrl({'entry_id':kEmbedSettings.entry_id,'partner_id':kEmbedSettings.p,'width':parseInt(options.width),'height':parseInt(options.height)});var playButtonUrl=SCRIPT_LOADER_URL.replace('ResourceLoader.php','skins/common/images/player_big_play_button.png');var playButtonCss='background: url(\''+playButtonUrl+'\'); width: 70px; height: 53px; position: absolute; top:50%; left:50%; margin: -26px 0 0 -35px;';var ddId='dd_'+Math.random();var ddHTML='<div id="'+ddId+'" style="width: '+options.width+';height:'+options.height+';position:relative">'+'<img style="width:100%;height:100%" src="'+thumbSrc+'" >'+'<a href="'+downloadUrl+'" target="_blank" style="'+playButtonCss+'"></a>'+'</div>';var parentNode=targetNode.parentNode;var div=document.createElement('div');div.style.width=options.width+'px';div.style.height=options.height+'px';div.innerHTML=ddHTML;parentNode.replaceChild(div,targetNode);if(!document.getElementById(ddId)){parentNode.insertBefore(div,targetNode);}}
kalturaDynamicEmbed=false;function kOverideJsFlashEmbed(){var doEmbedSettingsWrite=function(kEmbedSettings,replaceTargetId,widthStr,heightStr){var embedPlayerAttributes={'kwidgetid':kEmbedSettings.wid,'kuiconfid':kEmbedSettings.uiconf_id};kEmbedSettings.width=(widthStr)?(widthStr):$j('#'+replaceTargetId).width();kEmbedSettings.height=(heightStr)?(heightStr):$j('#'+replaceTargetId).height();if(kEmbedSettings.entry_id){embedPlayerAttributes.kentryid=kEmbedSettings.entry_id;embedPlayerAttributes.poster=mw.getKalturaThumbUrl({'width':parseInt(kEmbedSettings.width),'height':parseInt(kEmbedSettings.height),'entry_id':kEmbedSettings.entry_id,'partner_id':kEmbedSettings.p});}
if(mw.getConfig('Kaltura.IframeRewrite')){kalturaIframeEmbed(replaceTargetId,kEmbedSettings);}else{mw.ready(function(){$('#'+replaceTargetId).empty().css({'width':kEmbedSettings.width,'height':kEmbedSettings.height}).embedPlayer(embedPlayerAttributes);});}};if(window['flashembed']&&!window['originalFlashembed']){window['originalFlashembed']=window['flashembed'];window['flashembed']=function(targetId,attributes,flashvars){window.kalturaDynamicEmbed=true;kAddReadyHook(function(){var kEmbedSettings=kGetKalturaEmbedSettings(attributes.src,flashvars);if(!kWidget.supportsFlash()&&!kWidget.supportsHTML5()&&!mw.getConfig('Kaltura.ForceFlashOnDesktop')){kDirectDownloadFallback(targetId,kEmbedSettings,{'width':attributes.width,'height':attributes.height});return;}
if(kEmbedSettings.uiconf_id&&kIsHTML5FallForward()){document.getElementById(targetId).innerHTML='<div id="'+attributes.id+'"></div>';doEmbedSettingsWrite(kEmbedSettings,attributes.id,attributes.width,attributes.height);}else{if(kEmbedSettings.uiconf_id){restoreKalturaKDPCallback();}
originalFlashembed(targetId,attributes,flashvars);}});};}
if(window['SWFObject']&&!window['SWFObject'].prototype['originalWrite']){window['SWFObject'].prototype['originalWrite']=window['SWFObject'].prototype.write;window['SWFObject'].prototype['write']=function(targetId){kalturaDynamicEmbed=true;var _this=this;kAddReadyHook(function(){var kEmbedSettings=kGetKalturaEmbedSettings(_this.attributes.swf,_this.params.flashVars);if(kEmbedSettings.uiconf_id&&!kWidget.supportsFlash()&&!kWidget.supportsHTML5()&&!mw.getConfig('Kaltura.ForceFlashOnDesktop')){kDirectDownloadFallback(targetId,kEmbedSettings);return;}
if(kIsHTML5FallForward()&&kEmbedSettings.uiconf_id){doEmbedSettingsWrite(kEmbedSettings,targetId,_this.attributes.width,_this.attributes.height);}else{if(kEmbedSettings.uiconf_id){restoreKalturaKDPCallback();}
_this.originalWrite(targetId);}});};}
if(window['swfobject']&&!window['swfobject']['originalEmbedSWF']){window['swfobject']['originalEmbedSWF']=window['swfobject']['embedSWF'];window['swfobject']['embedSWF']=function(swfUrlStr,replaceElemIdStr,widthStr,heightStr,swfVersionStr,xiSwfUrlStr,flashvarsObj,parObj,attObj,callbackFn)
{kalturaDynamicEmbed=true;kAddReadyHook(function(){var kEmbedSettings=kGetKalturaEmbedSettings(swfUrlStr,flashvarsObj);if(kEmbedSettings.uiconf_id&&!kWidget.supportsFlash()&&!kWidget.supportsHTML5()&&!mw.getConfig('Kaltura.ForceFlashOnDesktop')){kDirectDownloadFallback(targetId,kEmbedSettings,{'width':widthStr,'height':heightStr});return;}
if(kIsHTML5FallForward()&&kEmbedSettings.uiconf_id){doEmbedSettingsWrite(kEmbedSettings,replaceElemIdStr,widthStr,heightStr);}else{if(kEmbedSettings.uiconf_id){restoreKalturaKDPCallback();}
window['swfobject']['originalEmbedSWF'](swfUrlStr,replaceElemIdStr,widthStr,heightStr,swfVersionStr,xiSwfUrlStr,flashvarsObj,parObj,attObj,callbackFn);}});};}}
function kCheckAddScript(){if(mw.getConfig('Kaltura.EnableEmbedUiConfJs')&&!mw.getConfig('Kaltura.UiConfJsLoaded')&&!mw.getConfig('EmbedPlayer.IsIframeServer')){var playerList=kGetKalturaPlayerList();var baseUiConfJsUrl=SCRIPT_LOADER_URL.replace('ResourceLoader.php','services.php?service=uiconfJs');var requestCount=playerList.length-1;for(var i=0;i<playerList.length;i++){kAppendScriptUrl(baseUiConfJsUrl+kEmbedSettingsToUrl(playerList[i].kEmbedSettings),function(){requestCount--;if(requestCount==0){kCheckAddScript();}});}
mw.setConfig('Kaltura.UiConfJsLoaded',true);return;}
if(mw.getConfig('disableForceMobileHTML5')){mw.setConfig('forceMobileHTML5',false);}
if(window.kUserAgentPlayerRules){kAddScript();return;}
var serviceUrl=mw.getConfig('Kaltura.ServiceUrl');if(!mw.getConfig('Kaltura.AllowIframeRemoteService')){if(!serviceUrl||serviceUrl.indexOf('kaltura.com')===-1){mw.setConfig('Kaltura.IframeRewrite',false);mw.setConfig('Kaltura.UseManifestUrls',false);}}
if(window.preMwEmbedReady.length){kAddScript();return;}
if(!mw.getConfig('Kaltura.ForceFlashOnDesktop')&&(mw.getConfig('Kaltura.LoadScriptForVideoTags')&&kPageHasAudioOrVideoTags())){kAddScript();return;}
if(kIsHTML5FallForward()&&kGetKalturaPlayerList().length){kAddScript();return;}
if(!kWidget.supportsFlash()&&!kWidget.supportsHTML5()&&!mw.getConfig('Kaltura.ForceFlashOnDesktop')){kAddScript();return;}
if(kGetKalturaPlayerList().length&&window.restoreKalturaKDPCallback){window.restoreKalturaKDPCallback();}}
function kIsHTML5FallForward(){if(kWidget.isIOS()||mw.getConfig('forceMobileHTML5')){return true;}
if(mw.getConfig('KalturaSupport.LeadWithHTML5')||mw.getConfig('Kaltura.LeadWithHTML5')){return kWidget.supportsHTML5();}
if(navigator.userAgent.indexOf('Android 2.')!=-1){if(mw.getConfig('EmbedPlayer.UseFlashOnAndroid')&&kWidget.supportsFlash()){return false;}else{return true;}}
if(kWidget.supportsFlash()){return false;}
if(mw.getConfig('Kaltura.ForceFlashOnDesktop')){return false;}
if(kWidget.supportsHTML5()){return true;}
if(mw.getConfig('Kaltura.IframeRewrite')){return true;}
return false;}
var kAddedScript=false;function kAddScript(callback){if(kAddedScript){if(callback)
callback();return;}
kAddedScript=true;if(window.jQuery&&!mw.versionIsAtLeast('1.3.2',jQuery.fn.jquery)){mw.setConfig('EmbedPlayer.EnableIframeApi',false);}
var jsRequestSet=[];if(typeof window.jQuery=='undefined'){jsRequestSet.push('window.jQuery');}
if(mw.getConfig('Kaltura.IframeRewrite')&&!kPageHasAudioOrVideoTags()){if(!window.kUserAgentPlayerRules&&mw.getConfig('EmbedPlayer.EnableIframeApi')&&(kWidget.supportsFlash()||kWidget.supportsHTML5())){jsRequestSet.push('mwEmbed','mw.style.mwCommon','$j.cookie','$j.postMessage','mw.EmbedPlayerNative','mw.IFramePlayerApiClient','mw.KWidgetSupport','mw.KDPMapping','JSON','fullScreenApi');kLoadJsRequestSet(jsRequestSet,callback);return;}else{kDoIframeRewriteList(kGetKalturaPlayerList());if(!window.preMwEmbedReady.length){return;}}}
jsRequestSet.push('mwEmbed','mw.Uri','fullScreenApi','mw.style.mwCommon','mw.EmbedPlayer','mw.processEmbedPlayers','mw.MediaElement','mw.MediaPlayer','mw.MediaPlayers','mw.MediaSource','mw.EmbedTypes','mw.style.EmbedPlayer','mw.PlayerControlBuilder','mw.PlayerSkinMvpcf','mw.style.PlayerSkinMvpcf','mw.EmbedPlayerNative','mw.EmbedPlayerKplayer','mw.EmbedPlayerJava','$j.ui','$j.widget','$j.ui.mouse','$j.fn.hoverIntent','$j.cookie','JSON','$j.ui.slider','$j.fn.menu','mw.style.jquerymenu','mw.TimedText','mw.style.TimedText');if(mw.getConfig('EmbedPlayer.IsIframeServer')){jsRequestSet.push('$j.postMessage','mw.IFramePlayerApiServer');}
if(!mw.getConfig('IframeCustomjQueryUISkinCss')){if(mw.getConfig('jQueryUISkin')){jsRequestSet.push('mw.style.ui_'+mw.getConfig('jQueryUISkin'));}else{jsRequestSet.push('mw.style.ui_kdark');}}
var objectPlayerList=kGetKalturaPlayerList();if(kIsHTML5FallForward()||objectPlayerList.length){jsRequestSet.push('MD5','utf8_encode','base64_encode',"mw.KApi",'mw.KWidgetSupport','mw.KAnalytics','mw.KDPMapping','mw.KCuePoints','mw.KTimedText','mw.KLayout','mw.style.klayout','titleLayout','volumeBarLayout','playlistPlugin','controlbarLayout','faderPlugin','watermarkPlugin','adPlugin','captionPlugin','bumperPlugin','myLogo');jsRequestSet.push('mw.Playlist','mw.style.playlist','mw.PlaylistHandlerMediaRss','mw.PlaylistHandlerKaltura','mw.PlaylistHandlerKalturaRss');jsRequestSet.push('iScroll');}
kLoadJsRequestSet(jsRequestSet,callback);}
function kAppendCssUrl(url){var head=document.getElementsByTagName("head")[0];var cssNode=document.createElement('link');cssNode.type='text/css';cssNode.rel='stylesheet';cssNode.media='screen';cssNode.href=url;head.appendChild(cssNode);}
function kAppendScriptUrl(url,callback){var script=document.createElement('script');script.type='text/javascript';script.src=url;if(callback){script.onload=callback;}
document.getElementsByTagName('head')[0].appendChild(script);}
function kLoadJsRequestSet(jsRequestSet,callback){if(typeof SCRIPT_LOADER_URL=='undefined'){alert('Error invalid entry point');}
var url=SCRIPT_LOADER_URL+'?class=';url+=jsRequestSet.join(',')+',';url+='&urid='+KALTURA_LOADER_VERSION;url+='&uselang=en';if(mw.getConfig('debug')){url+='&debug=true';}
if(typeof $!='undefined'&&!$.jquery){window['pre$Lib']=$;}
kAppendScriptUrl(url,function(){if(window['pre$Lib']){jQuery.noConflict();window['$']=window['pre$Lib'];}
if(callback){callback();}});}
function kPageHasAudioOrVideoTags(){if(mw.getConfig('EmbedPlayer.RewriteSelector')===false||mw.getConfig('EmbedPlayer.RewriteSelector')==''){return false;}
if(document.getElementsByTagName('video').length!=0||document.getElementsByTagName('audio').length!=0){return true;}
return false;}
var kReadyHookSet=[];function kAddReadyHook(callback){if(kWidget.domIsReady){callback();}else{kReadyHookSet.push(callback);}}
function kRunMwDomReady(event){kWidget.domIsReady=true;while(kReadyHookSet.length){kReadyHookSet.shift()();}
kOverideJsFlashEmbed();if(mw.getConfig('EmbedPlayer.IsIframeServer')&&event!=='endOfIframeJs'){return;}
kCheckAddScript();}
if(document.readyState==="complete"){kRunMwDomReady();}
if(!mw.getConfig('EmbedPlayer.IsIframeServer')){kSiteOnLoadCall=false;var kDomReadyCall=function(){if(typeof kSiteOnLoadCall=='function'){kSiteOnLoadCall();}
kRunMwDomReady();};if(window.onload&&window.onload.toString()!=kDomReadyCall.toString()){kSiteOnLoadCall=window.onload;}
window.onload=kDomReadyCall;}
if(document.addEventListener){DOMContentLoaded=function(){document.removeEventListener("DOMContentLoaded",DOMContentLoaded,false);kRunMwDomReady();};}else if(document.attachEvent){DOMContentLoaded=function(){if(document.readyState==="complete"){document.detachEvent("onreadystatechange",DOMContentLoaded);kRunMwDomReady();}};}
if(document.addEventListener){document.addEventListener("DOMContentLoaded",DOMContentLoaded,false);}else if(document.attachEvent){document.attachEvent("onreadystatechange",DOMContentLoaded);var toplevel=false;try{toplevel=window.frameElement==null;}catch(e){}
if(document.documentElement.doScroll&&toplevel){doScrollCheck();}}
if(document.addEventListener){window.addEventListener("load",kRunMwDomReady,false);}
function doScrollCheck(){if(kWidget.domIsReady){return;}
try{document.documentElement.doScroll("left");}catch(error){setTimeout(doScrollCheck,1);return;}
kRunMwDomReady();}
function kGetKalturaPlayerList(){var kalturaPlayers=[];var objectList=document.getElementsByTagName('object');if(!objectList.length&&document.getElementById('kaltura_player')){objectList=[document.getElementById('kaltura_player')];}
var tryAddKalturaEmbed=function(url,flashvars){var settings=kGetKalturaEmbedSettings(url,flashvars);if(settings&&settings.uiconf_id&&settings.wid){objectList[i].kEmbedSettings=settings;kalturaPlayers.push(objectList[i]);return true;}
return false;};for(var i=0;i<objectList.length;i++){if(!objectList[i]){continue;}
var swfUrl='';var flashvars={};var paramTags=objectList[i].getElementsByTagName('param');for(var j=0;j<paramTags.length;j++){var pName=paramTags[j].getAttribute('name').toLowerCase();var pVal=paramTags[j].getAttribute('value');if(pName=='data'||pName=='src'||pName=='movie'){swfUrl=pVal;}
if(pName=='flashvars'){flashvars=kFlashVars2Object(pVal);}}
if(tryAddKalturaEmbed(swfUrl,flashvars)){continue;}
if(objectList[i].getAttribute('data')){if(tryAddKalturaEmbed(objectList[i].getAttribute('data'),flashvars))
continue;}}
return kalturaPlayers;};function kFlashVars2Object(flashvarsString){var flashVarsSet=(flashvarsString)?flashvarsString.split('&'):[];var flashvars={};for(var i=0;i<flashVarsSet.length;i++){var currentVar=flashVarsSet[i].split('=');if(currentVar[0]&&currentVar[1]){flashvars[currentVar[0]]=currentVar[1];}}
return flashvars;}
function kServiceConfigToUrl(){var serviceVars=['ServiceUrl','CdnUrl','ServiceBase','UseManifestUrls'];var urlParam='';for(var i=0;i<serviceVars.length;i++){if(mw.getConfig('Kaltura.'+serviceVars[i])!==null){urlParam+='&'+serviceVars[i]+'='+encodeURIComponent(mw.getConfig('Kaltura.'+serviceVars[i]));}}
return urlParam;}
function kFlashVarsToUrl(flashVarsObject){var params='';for(var i in flashVarsObject){params+='&'+'flashvars['+encodeURIComponent(i)+']='+encodeURIComponent(flashVarsObject[i]);}
return params;}
function kFlashVarsToString(flashVarsObject){var params='';for(var i in flashVarsObject){params+='&'+''+encodeURIComponent(i)+'='+encodeURIComponent(flashVarsObject[i]);}
return params;}
mw.getKalturaThumbUrl=function(entry){if(entry.width=='100%')
entry.width=400;if(entry.height=='100%')
entry.height=300;var ks=(entry.ks)?'?ks='+entry.ks:'';if(entry.widget_id&&!entry.partner_id){entry.partner_id=entry.widget_id.substr(1);}
return mw.getConfig('Kaltura.CdnUrl')+'/p/'+entry.partner_id+'/sp/'+
entry.partner_id+'00/thumbnail/entry_id/'+entry.entry_id+'/width/'+
parseInt(entry.width)+'/height/'+parseInt(entry.height)+ks;};function kGetKalturaEmbedSettings(swfUrl,flashvars){var embedSettings={};if(typeof flashvars=='string'){flashvars=kFlashVars2Object(flashvars);}
if(!flashvars){flashvars={};}
var trim=function(str){return str.replace(/^\s+|\s+$/g,"");}
embedSettings.flashvars=flashvars;var dataUrlParts=swfUrl.split('/');var prevUrlPart=null;while(dataUrlParts.length){var curUrlPart=dataUrlParts.pop();switch(curUrlPart){case'p':embedSettings.wid='_'+prevUrlPart;embedSettings.p=prevUrlPart;break;case'wid':embedSettings.wid=prevUrlPart;embedSettings.p=prevUrlPart.replace(/_/,'');break;case'entry_id':embedSettings.entry_id=prevUrlPart;break;case'uiconf_id':case'ui_conf_id':embedSettings.uiconf_id=prevUrlPart;break;case'cache_st':embedSettings.cache_st=prevUrlPart;break;}
prevUrlPart=trim(curUrlPart);}
for(var key in flashvars){var val=flashvars[key];var key=key.toLowerCase();if(key=='entryid'){embedSettings.entry_id=val;}
if(key=='uiconfid'){embedSettings.uiconf_id=val;}
if(key=='widgetid'||key=='widget_id'){embedSettings.wid=val;embedSettings.p=val.replace(/_/,'');}
if(key=='partnerid'||key=='partner_id'){embedSettings.wid='_'+val;embedSettings.p=val;}
if(key=='referenceid'){embedSettings.reference_id=val;}}
if(!embedSettings.cache_st)
embedSettings.cache_st=1;return embedSettings;}
function kGetAdditionalTargetCss(){var ua=navigator.userAgent;if(mw.getConfig('FramesetSupport.Enabled')&&kWidget.isIOS()&&(ua.indexOf('OS 3')>0||ua.indexOf('OS 4')>0)){return mw.getConfig('FramesetSupport.PlayerCssProperties')||{};}
return{};}
kAddReadyHook(function(){if(mw.getConfig('FramesetSupport.Enabled')&&kWidget.isIOS()){mw.setConfig('EmbedPlayer.EnableIpadHTMLControls',false);}})
window.KalturaKDPCallbackAlreadyCalled=[];window.checkForKDPCallback=function(){var pushAlreadyCalled=function(player_id){window.KalturaKDPCallbackAlreadyCalled.push(player_id);}
if(window.jsCallbackReady&&window.jsCallbackReady.toString()!=pushAlreadyCalled.toString()&&window.KalturaKDPCallbackReady){window.originalKDPCallbackReady=window.jsCallbackReady;}
if(!window.jsCallbackReady||window.jsCallbackReady.toString()!=pushAlreadyCalled.toString()){window.jsCallbackReady=pushAlreadyCalled;}
if(!window.KalturaKDPCallbackReady){window.KalturaKDPCallbackReady=function(playerId){if(window.originalKDPCallbackReady){window.originalKDPCallbackReady(playerId);}
window.KWidget.globalJsReadyCallback(playerId);};}};function kIsIOS(){kWidget.log('kIsIOS is deprecated. Please use kWidget.isIOS');return kWidget.isIOS();}
function kSupportsHTML5(){kWidget.log('kSupportsHTML5 is deprecated. Please use kWidget.supportsHTML5');return kWidget.supportsHTML5();}
function kGetFlashVersion(){kWidget.log('kGetFlashVersion is deprecated. Please use kWidget.getFlashVersion');return kWidget.getFlashVersion();}
function kSupportsFlash(){kWidget.log('kSupportsFlash is deprecated. Please use kWidget.supportsFlash');return kWidget.supportsFlash();}
function kOutputFlashObject(targetId,settings){kWidget.log('kOutputFlashObject is deprecated. Please use kWidget.outputFlashObject');kWidget.outputFlashObject(targetId,settings);}
function kIsIE(){return/msie/i.test(navigator.userAgent)&&!/opera/i.test(navigator.userAgent);}
checkForKDPCallback();kAddReadyHook(checkForKDPCallback);window.getUserAgentPlayerRulesMsg=function(ruleSet){return window.checkUserAgentPlayerRules(ruleSet,true);};window.checkUserAgentPlayerRules=function(ruleSet,getMsg){var ua=(mw.getConfig('KalturaSupport_ForceUserAgent'))?mw.getConfig('KalturaSupport_ForceUserAgent'):navigator.userAgent;var flashMode={mode:'flash',val:true};if(!ruleSet.rules){return flashMode;}
var getAction=function(inx){if(ruleSet.actions&&ruleSet.actions[inx]){return ruleSet.actions[inx];}
return flashMode;};for(var i in ruleSet.rules){var rule=ruleSet.rules[i];if(rule.match){if(ua.indexOf(rule.match)!==-1)
return getAction(i);}else if(rule.regMatch){if(ua.match(eval(rule.regMatch)))
return getAction(i);}}
return flashMode;};mw.setConfig('debug',false);mw.setConfig('Kaltura.UseManifestUrls',true);mw.setConfig('Kaltura.ServiceUrl','http://cdnapi.kaltura.com');mw.setConfig('Kaltura.ServiceBase','/api_v3/index.php?service=');mw.setConfig('Kaltura.CdnUrl','http://cdnbakmi.kaltura.com');mw.setConfig('Kaltura.StatsServiceUrl','http://stats.kaltura.com');mw.setConfig('Kaltura.IframeRewrite',true);mw.setConfig('EmbedPlayer.EnableIframeApi',true);mw.setConfig('EmbedPlayer.EnableIpadHTMLControls',true);mw.setConfig('EmbedPlayer.UseFlashOnAndroid',true);mw.setConfig('Kaltura.LoadScriptForVideoTags',true);mw.setConfig('Kaltura.AllowIframeRemoteService',true);mw.setConfig('Kaltura.UseAppleAdaptive',true);mw.setConfig('Kaltura.EnableEmbedUiConfJs',false);