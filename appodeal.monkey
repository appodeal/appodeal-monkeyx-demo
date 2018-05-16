#If TARGET<>"android" And TARGET<>"ios"
#Error "Appodeal module is only available on the android and ios targets"
#End

#If TARGET="android"

Import "native/appodeal.android.java"
Import "native/usersettings.android.java"
Import "native/callbacks/bannercallbacks.android.java"
Import "native/callbacks/interstitialcallbacks.android.java"
Import "native/callbacks/nonskippablevideocallbacks.android.java"
Import "native/callbacks/rewardedvideocallbacks.android.java"

#LIBS+="${CD}/native/android/appodeal-2.1.11.jar"
#LIBS+="${CD}/native/android/inmobi-6.2.3.jar"
#LIBS+="${CD}/native/android/ogury-2.1.15.jar"
#LIBS+="${CD}/native/android/picasso-2.5.2.jar"
#LIBS+="${CD}/native/android/startapp-3.6.7.jar"
#LIBS+="${CD}/native/android/yandex-metrica-2.73.jar"
#LIBS+="${CD}/native/android/adcolony-3.2.1.jar"


#ANDROID_MANIFEST_MAIN+="<uses-permission android:name=~qandroid.permission.ACCESS_NETWORK_STATE~q /><uses-permission android:name=~qandroid.permission.INTERNET~q /><uses-permission android:name=~qandroid.permission.ACCESS_COARSE_LOCATION~q /><uses-permission android:name=~qandroid.permission.WRITE_EXTERNAL_STORAGE~q />"
#ANDROID_MANIFEST_APPLICATION+="
	<activity android:name=~qcom.appodeal.ads.InterstitialActivity~q
	android:configChanges=~qorientation|screenSize~q
	android:theme=~q@android:style/Theme.NoTitleBar.Fullscreen~q/>
<activity android:name=~qcom.appodeal.ads.VideoActivity~q
	android:configChanges=~qorientation|screenSize~q
	android:theme=~q@android:style/Theme.NoTitleBar.Fullscreen~q/>
<activity android:name=~qcom.appodeal.ads.LoaderActivity~q
	android:configChanges=~qorientation|screenSize~q
	android:theme=~q@android:style/Theme.NoTitleBar.Fullscreen~q/>
<activity android:name=~qcom.appodeal.ads.VideoPlayerActivity~q
	android:theme=~q@android:style/Theme.Black.NoTitleBar.Fullscreen~q/>
<receiver android:name=~qcom.appodeal.ads.AppodealPackageAddedReceiver~q android:exported=~qtrue~q android:enabled=~qtrue~q>
	<intent-filter>
		<action android:name=~qandroid.intent.action.PACKAGE_ADDED~q/>
		<data android:scheme=~qpackage~q/>
	</intent-filter>
</receiver>
<activity android:name=~qcom.appodeal.ads.TestActivity~q
	android:theme=~q@android:style/Theme.Translucent.NoTitleBar~q/>

<meta-data android:name=~qcom.google.android.gms.version~q android:value=~q@integer/google_play_services_version~q/>
<activity android:name=~qcom.google.android.gms.ads.AdActivity~q
	android:configChanges=~qkeyboard|keyboardHidden|orientation|screenLayout|uiMode|screenSize|smallestScreenSize~q
	android:theme=~q@android:style/Theme.NoTitleBar.Fullscreen~q/>

<activity android:name=~qcom.chartboost.sdk.CBImpressionActivity~q android:excludeFromRecents=~qtrue~q
	android:hardwareAccelerated=~qtrue~q android:theme=~q@android:style/Theme.Translucent.NoTitleBar.Fullscreen~q
	android:configChanges=~qkeyboardHidden|orientation|screenSize~q/>

<activity android:name=~qcom.applovin.adview.AppLovinInterstitialActivity~q android:configChanges=~qorientation|screenSize~q/>
<activity android:name=~qcom.applovin.adview.AppLovinConfirmationActivity~q android:configChanges=~qorientation|screenSize~q/>

<activity android:name=~qcom.mopub.mobileads.MoPubActivity~q
	android:configChanges=~qkeyboardHidden|orientation|screenSize~q
	android:theme=~q@android:style/Theme.Translucent.NoTitleBar.Fullscreen~q/>
<activity android:name=~qcom.mopub.common.MoPubBrowser~q
	android:configChanges=~qkeyboardHidden|orientation|screenSize~q/>
<activity android:name=~qcom.mopub.mobileads.MraidActivity~q
	android:configChanges=~qkeyboardHidden|orientation|screenSize~q/>
<activity android:name=~qcom.mopub.mobileads.MraidVideoPlayerActivity~q
	android:configChanges=~qkeyboardHidden|orientation|screenSize~q/>
<activity android:name=~qcom.mopub.mobileads.RewardedMraidActivity~q
	android:configChanges=~qkeyboardHidden|orientation|screenSize~q/>

<activity android:name=~qorg.nexage.sourcekit.vast.activity.VASTActivity~q
	android:theme=~q@android:style/Theme.NoTitleBar.Fullscreen~q
	android:configChanges=~qkeyboardHidden|orientation|screenSize~q/>

<activity android:name=~qorg.nexage.sourcekit.vast.activity.VPAIDActivity~q
	android:theme=~q@android:style/Theme.NoTitleBar.Fullscreen~q/>

<activity android:name=~qcom.appodeal.ads.networks.vpaid.VPAIDActivity~q
	android:theme=~q@android:style/Theme.NoTitleBar.Fullscreen~q/>

<activity android:name=~qcom.amazon.device.ads.AdActivity~q android:configChanges=~qkeyboardHidden|orientation|screenSize~q/>

<activity android:name=~qcom.my.target.ads.MyTargetActivity~q android:configChanges=~qkeyboard|keyboardHidden|orientation|screenLayout|uiMode|screenSize|smallestScreenSize~q
	android:hardwareAccelerated=~qtrue~q/>


<activity android:name=~qcom.facebook.ads.AudienceNetworkActivity~q android:configChanges=~qkeyboardHidden|orientation|screenSize~q/>


<activity android:name=~qcom.startapp.android.publish.ads.list3d.List3DActivity~q
	android:theme=~q@android:style/Theme~q/>

<activity android:name=~qcom.startapp.android.publish.adsCommon.activities.OverlayActivity~q
	android:theme=~q@android:style/Theme.NoTitleBar.Fullscreen~q
	android:configChanges=~qorientation|keyboardHidden|screenSize~q/>

<activity android:name=~qcom.startapp.android.publish.adsCommon.activities.FullScreenActivity~q
	android:theme=~q@android:style/Theme~q
	android:configChanges=~qorientation|keyboardHidden|screenSize~q/>

<service android:name=~qcom.startapp.android.publish.common.metaData.PeriodicMetaDataService~q/>

<service android:name=~qcom.startapp.android.publish.common.metaData.InfoEventService~q/>
<receiver android:name=~qcom.startapp.android.publish.common.metaData.BootCompleteListener~q >
	<intent-filter>
		<action android:name=~qandroid.intent.action.BOOT_COMPLETED~q/>
	</intent-filter>
</receiver>


<service android:name=~qcom.yandex.metrica.MetricaService~q android:enabled=~qtrue~q
	android:exported=~qtrue~q android:process=~q:Metrica~q>
	<intent-filter>
		<category android:name=~qandroid.intent.category.DEFAULT~q/>
		<action android:name=~qcom.yandex.metrica.IMetricaService~q/>
		<data android:scheme=~qmetrica~q/>
	</intent-filter>
	<meta-data android:name=~qmetrica:api:level~q android:value=~q58~q/>
</service>
<receiver android:name=~qcom.yandex.metrica.MetricaEventHandler~q
	android:enabled=~qtrue~q android:exported=~qtrue~q>
	<intent-filter>
		<action android:name=~qcom.android.vending.INSTALL_REFERRER~q/>
	</intent-filter>
</receiver>


<activity android:name=~qcom.yandex.mobile.ads.AdActivity~q
	android:configChanges=~qkeyboard|keyboardHidden|orientation|screenLayout|uiMode|screenSize|smallestScreenSize~q/>

<activity android:name=~qcom.unity3d.ads.adunit.AdUnitActivity~q
	android:configChanges=~qfontScale|keyboard|keyboardHidden|locale|mnc|mcc|navigation|orientation|screenLayout|screenSize|smallestScreenSize|uiMode|touchscreen~q
	android:theme=~q@android:style/Theme.NoTitleBar.Fullscreen~q android:hardwareAccelerated=~qtrue~q/>
<activity android:name=~qcom.unity3d.ads.adunit.AdUnitSoftwareActivity~q
	android:configChanges=~qfontScale|keyboard|keyboardHidden|locale|mnc|mcc|navigation|orientation|screenLayout|screenSize|smallestScreenSize|uiMode|touchscreen~q
	android:theme=~q@android:style/Theme.NoTitleBar.Fullscreen~q android:hardwareAccelerated=~qfalse~q/>
<activity android:name=~qcom.unity3d.ads2.adunit.AdUnitActivity~q
	android:configChanges=~qfontScale|keyboard|keyboardHidden|locale|mnc|mcc|navigation|orientation|screenLayout|screenSize|smallestScreenSize|uiMode|touchscreen~q
	android:theme=~q@android:style/Theme.NoTitleBar.Fullscreen~q android:hardwareAccelerated=~qtrue~q/>
<activity android:name=~qcom.unity3d.ads2.adunit.AdUnitSoftwareActivity~q
	android:configChanges=~qfontScale|keyboard|keyboardHidden|locale|mnc|mcc|navigation|orientation|screenLayout|screenSize|smallestScreenSize|uiMode|touchscreen~q
	android:theme=~q@android:style/Theme.NoTitleBar.Fullscreen~q android:hardwareAccelerated=~qfalse~q/>


<activity android:name=~qcom.jirbo.adcolony.AdColonyOverlay~q
	android:configChanges=~qkeyboardHidden|orientation|screenSize~q
	android:theme=~q@android:style/Theme.Translucent.NoTitleBar.Fullscreen~q/>

<activity android:name=~qcom.jirbo.adcolony.AdColonyFullscreen~q
	android:configChanges=~qkeyboardHidden|orientation|screenSize~q
	android:theme=~q@android:style/Theme.Black.NoTitleBar.Fullscreen~q/>

<activity android:name=~qcom.jirbo.adcolony.AdColonyBrowser~q
	android:configChanges=~qkeyboardHidden|orientation|screenSize~q
	android:theme=~q@android:style/Theme.Black.NoTitleBar.Fullscreen~q/>


<activity android:name=~qcom.vungle.publisher.VideoFullScreenAdActivity~q
	android:configChanges=~qkeyboardHidden|orientation|screenSize|screenLayout|smallestScreenSize~q
	android:theme=~q@android:style/Theme.NoTitleBar.Fullscreen~q/>

<activity android:name=~qcom.vungle.publisher.MraidFullScreenAdActivity~q
	android:configChanges=~qkeyboardHidden|orientation|screenSize|screenLayout|smallestScreenSize~q
	android:theme=~q@android:style/Theme.Translucent.NoTitleBar.Fullscreen~q/>

<activity android:name=~qcom.vungle.publisher.FlexViewAdActivity~q
	android:configChanges=~qkeyboardHidden|orientation|screenSize|screenLayout|smallestScreenSize~q
	android:theme=~q@android:style/Theme.Translucent.NoTitleBar.Fullscreen~q/>

<activity android:name=~qcom.tapjoy.TJAdUnitActivity~q android:configChanges=~qorientation|keyboardHidden|screenSize~q
	android:hardwareAccelerated=~qtrue~q android:theme=~q@android:style/Theme.Translucent.NoTitleBar.Fullscreen~q/>

<activity android:name=~qcom.tapjoy.mraid.view.ActionHandler~q android:configChanges=~qorientation|keyboardHidden|screenSize~q/>

<activity android:name=~qcom.tapjoy.mraid.view.Browser~q android:configChanges=~qorientation|keyboardHidden|screenSize~q/>

<activity android:name=~qcom.tapjoy.TJContentActivity~q android:configChanges=~qorientation|keyboardHidden|screenSize~q
	android:theme=~q@android:style/Theme.Translucent.NoTitleBar~q android:hardwareAccelerated=~qtrue~q/>


<activity android:name=~qcom.ironsource.sdk.controller.ControllerActivity~q android:configChanges=~qorientation|screenSize~q
	android:hardwareAccelerated=~qtrue~q/>

<activity android:name=~qcom.ironsource.sdk.controller.InterstitialActivity~q android:configChanges=~qorientation|screenSize~q
	android:hardwareAccelerated=~qtrue~q android:theme=~q@android:style/Theme.Translucent~q/>

<activity android:name=~qcom.ironsource.sdk.controller.OpenUrlActivity~q android:configChanges=~qorientation|screenSize~q
	android:hardwareAccelerated=~qtrue~q android:theme=~q@android:style/Theme.Translucent~q/>


<activity android:name=~qcom.adcolony.sdk.AdColonyInterstitialActivity~q android:configChanges=~qkeyboardHidden|orientation|screenSize~q
	android:hardwareAccelerated=~qtrue~q/>

<activity android:name=~qcom.adcolony.sdk.AdColonyAdViewActivity~q android:configChanges=~qkeyboardHidden|orientation|screenSize~q
	android:hardwareAccelerated=~qtrue~q/>

<activity android:name=~qcom.inmobi.rendering.InMobiAdActivity~q android:configChanges=~qkeyboardHidden|orientation|keyboard|smallestScreenSize|screenSize|screenLayout~q
	android:hardwareAccelerated=~qtrue~q android:theme=~q@android:style/Theme.NoTitleBar~q/>
<receiver android:name=~qcom.inmobi.commons.core.utilities.uid.ImIdShareBroadCastReceiver~q android:enabled=~qtrue~q android:exported=~qtrue~q>
	<intent-filter>
		<action android:name=~qcom.inmobi.share.id~q/>
	</intent-filter>
</receiver>

<meta-data android:name=~qpresage_key~q android:value=~q000000~q/>
<service android:name=~qio.presage.PresageService~q android:enabled=~qtrue~q android:exported=~qtrue~q android:process=~q:remote~q>
	<intent-filter>
		<action android:name=~qio.presage.PresageService.PIVOT~q/>
	</intent-filter>
</service>
<activity android:name=~qio.presage.activities.PresageActivity~q android:configChanges=~qkeyboard|keyboardHidden|orientation|screenSize~q
	android:hardwareAccelerated=~qtrue~q android:theme=~q@android:style/Theme.Translucent.NoTitleBar~q>
	<intent-filter>
		<action android:name=~qio.presage.intent.action.LAUNCH_WEBVIEW~q/>
		<category android:name=~qandroid.intent.category.DEFAULT~q/>
	</intent-filter>
</activity>
<receiver android:name=~qio.presage.receiver.NetworkChangeReceiver~q>
	<intent-filter>
		<action android:name=~qandroid.net.conn.CONNECTIVITY_CHANGE~q/>
		<action android:name=~qandroid.net.wifi.WIFI_STATE_CHANGED~q/>
		<action android:name=~qio.presage.receiver.NetworkChangeReceiver.ONDESTROY~q/>
	</intent-filter>
</receiver>
<receiver android:name=~qio.presage.receiver.AlarmReceiver~q/>
<provider
	android:name=~qio.presage.provider.PresageProvider~q
	android:authorities=~q${applicationId}.PresageProvider~q
	android:enabled=~qtrue~q
	android:exported=~qtrue~q/>"


#Elseif TARGET="ios"

Import "native/appodeal.ios.cpp"

#LIBS+="AdSupport.framework"
#LIBS+="AudioToolbox.framework"
#LIBS+="AVFoundation.framework"
#LIBS+="CFNetwork.framework"
#LIBS+="CoreGraphics.framework"
#LIBS+="CoreImage.framework"
#LIBS+="CoreLocation.framework"
#LIBS+="CoreMedia.framework"
#LIBS+="CoreMotion.framework"
#LIBS+="CoreTelephony.framework"
#LIBS+="EventKitUI.framework"
#LIBS+="GLKit.framework"
#LIBS+="ImageIO.framework"
#LIBS+="JavaScriptCore.framework"
#LIBS+="MediaPlayer.framework"
#LIBS+="MessageUI.framework"
#LIBS+="MobileCoreServices.framework"
#LIBS+="QuartzCore.framework"
#LIBS+="Security.framework"
#LIBS+="StoreKit.framework"
#LIBS+="SystemConfiguration.framework"
#LIBS+="UIKit.framework"
#LIBS+="WebKit.framework"

#end 


Extern
Class AdAppodeal Extends Null="BBAppodeal"

	Function GetAppodeal:AdAppodeal()
		
	Method initialize:Void(appKey:String,adType:Int)
	Method show:Bool(adType:Int)
	Method show:Bool(adType:Int, placement:String)
	Method cache:Void(adType:Int)
	Method hide:Void(adType:Int)
	Method isLoaded:Bool(adType:Int)
	Method isPrecache:Bool(adType:Int)
	Method setAutoCache:Void(adType:Int,state:Bool)
	Method disableNetwork:Void(network:String)
	Method disableNetwork:Void(network:String,adType:Int)
	Method disableLocationPermissionCheck:Void()
	Method disableWriteExternalStoragePermissionCheck:Void()
	Method setBannerAnimation:Void(state:Bool)
	Method setSmartBanners:Void(state:Bool)
	Method trackInAppPurchase:Void(amount:Float,currency:String)
	Method setTesting:Void(state:Bool)
	Method setLogLevel:Void(level:String)
	Method setBannerBackground:Void(state:Bool)
	Method set728x90Banners:Void(state:Bool)
	Method setOnLoadedTriggerBoth:Void(adType:Int,state:Bool)
	Method requestAndroidMPermissions:Void()
	Method showMessage:Void(message:String)
	Method setCustomRule:Void(name:String,value:Bool)
	Method setCustomRule:Void(name:String,value:Int)
	Method setCustomRule:Void(name:String,value:String)
	Method setCustomRule:Void(name:String,value:Float)
	Method setBannerCallbacks(callbacks:AdBannerCallbacks)
	Method setInterstitialCallbacks(callbacks:AdInterstitialCallbacks)
	Method setNonSkippableVideoCallbacks(callbacks:AdNonSkippableVideoCallbacks)
	Method setRewardedVideoCallbacks(callbacks:AdRewardedVideoCallbacks)
	Method GetUserSettings:AdUserSettings()

End

Extern
Class AdUserSettings Extends Null="BBUserSettings"
	Method setAge:Void(age:Int)
	Method setGender:Void(gender:Int)
	Method setUserId:Void(userId:String)
End

Extern
Class AdBannerCallbacks Extends Null="BBBannerCallbacks"
	Method onBannerClicked:Void() Abstract
	Method onBannerFailedToLoad:Void() Abstract
	Method onBannerLoaded:Void(height:Int,isPrecache:Bool) Abstract
	Method onBannerShown:Void() Abstract
End

Extern
Class AdInterstitialCallbacks Extends Null="BBInterstitialCallbacks"
	Method onInterstitialClicked:Void() Abstract
	Method onInterstitialClosed:Void() Abstract
	Method onInterstitialLoaded:Void(isPrecache:Bool) Abstract
	Method onInterstitialFailedToLoad:Void() Abstract
	Method onInterstitialShown:Void() Abstract
End

Extern
Class AdNonSkippableVideoCallbacks Extends Null="BBNonSkippableVideoCallbacks"
	Method onNonSkippableVideoClosed:Void() Abstract
	Method onNonSkippableVideoFailedToLoad:Void() Abstract
	Method onNonSkippableVideoFinished:Void() Abstract
	Method onNonSkippableVideoLoaded:Void() Abstract
	Method onNonSkippableVideoShown:Void() Abstract
End

Extern
Class AdRewardedVideoCallbacks Extends Null="BBRewardedVideoCallbacks"
	Method onRewardedVideoClosed:Void() Abstract
	Method onRewardedVideoFailedToLoad:Void() Abstract
	Method onRewardedVideoFinished:Void(amount:Int,name:String) Abstract
	Method onRewardedVideoLoaded:Void() Abstract
	Method onRewardedVideoShown:Void() Abstract
End

Public
Class AdType
	Const NONE:=0
	Const INTERSTITIAL:=3
	Const SKIPPABLE_VIDEO:=2
	Const BANNER:=4
	Const BANNER_BOTTOM:=8
	Const BANNER_TOP:=16
	Const REWARDED_VIDEO:=128
#If TARGET="android"
	Const NON_SKIPPABLE_VIDEO:=128
#Elseif TARGET="ios"
	Const NON_SKIPPABLE_VIDEO:=256
#End
End

Public
Class AdLogLevel
	Const none := "none"
	Const debug := "debug"
	Const verbose := "verbose"
End

Public
Class AdGender
	Const FEMALE:=0
	Const MALE:=1
	Const OTHER:=2
End
