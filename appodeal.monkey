#If TARGET<>"android" And TARGET<>"ios"
#Error "The Admob module is only available on the android and ios targets"
#End

#If TARGET="android"

Import "native/appodeal.android.java"
Import "native/usersettings.android.java"
Import "native/callbacks/bannercallbacks.android.java"
Import "native/callbacks/interstitialcallbacks.android.java"
Import "native/callbacks/nonskippablevideocallbacks.android.java"
Import "native/callbacks/rewardedvideocallbacks.android.java"

#LIBS+="${CD}/native/android/android-support-v4-23.1.2-trimmed.jar"
#LIBS+="${CD}/native/android/appodeal-1.16.jar"
#LIBS+="${CD}/native/android/google-play-services.jar"
#LIBS+="${CD}/native/android/flurry-analytics-6.6.0.jar"
#LIBS+="${CD}/native/android/yandex-metrica-2.51.jar"
#LIBS+="${CD}/native/android/applovin-6.3.2.jar"
#LIBS+="${CD}/native/android/chartboost-6.6.1.jar"
#LIBS+="${CD}/native/android/my-target-4.5.15.jar"
#LIBS+="${CD}/native/android/unity-ads-2.0.5.jar"

#ANDROID_MANIFEST_MAIN+="<uses-permission android:name=~qandroid.permission.ACCESS_NETWORK_STATE~q /><uses-permission android:name=~qandroid.permission.INTERNET~q /><uses-permission android:name=~qandroid.permission.ACCESS_COARSE_LOCATION~q /><uses-permission android:name=~qandroid.permission.WRITE_EXTERNAL_STORAGE~q />"
#ANDROID_MANIFEST_APPLICATION+="
    <meta-data android:name=~qcom.appodeal.framework~q android:value=~qmonkey~q />
	<receiver android:name=~qcom.appodeal.ads.AppodealPackageAddedReceiver~q android:exported=~qtrue~q android:enabled=~qtrue~q>
	<intent-filter>
		<action android:name=~qandroid.intent.action.PACKAGE_ADDED~q />
		<data android:scheme=~qpackage~q />
	</intent-filter>
	</receiver>

	<activity android:name=~qcom.appodeal.ads.InterstitialActivity~q
		  android:configChanges=~qorientation|screenSize~q
		  android:theme=~q@android:style/Theme.Translucent.NoTitleBar~q />
	<activity android:name=~qcom.appodeal.ads.VideoActivity~q
		  android:configChanges=~qorientation|screenSize~q
		  android:theme=~q@android:style/Theme.Translucent.NoTitleBar~q />

	<activity android:name=~qcom.appodeal.ads.LoaderActivity~q
		  android:configChanges=~qorientation|screenSize~q
		  android:theme=~q@android:style/Theme.Translucent.NoTitleBar~q />

	<meta-data android:name=~qcom.google.android.gms.version~q android:value=~q@integer/google_play_services_version~q />

	<activity android:name=~qcom.google.android.gms.ads.AdActivity~q
		  android:configChanges=~qkeyboard|keyboardHidden|orientation|screenLayout|uiMode|screenSize|smallestScreenSize~q
		  android:theme=~q@android:style/Theme.Translucent~q />

	<activity android:name=~qcom.chartboost.sdk.CBImpressionActivity~q android:excludeFromRecents=~qtrue~q
		  android:hardwareAccelerated=~qtrue~q android:theme=~q@android:style/Theme.Translucent.NoTitleBar.Fullscreen~q
		  android:configChanges=~qkeyboardHidden|orientation|screenSize~q />

	<activity android:name=~qcom.applovin.adview.AppLovinInterstitialActivity~q
		  android:theme=~q@android:style/Theme.Translucent~q />

	<activity android:name=~qcom.mopub.mobileads.MoPubActivity~q
		  android:configChanges=~qkeyboardHidden|orientation|screenSize~q
		  android:theme=~q@android:style/Theme.Translucent~q />
	<activity android:name=~qcom.mopub.common.MoPubBrowser~q
		  android:configChanges=~qkeyboardHidden|orientation|screenSize~q />
	<activity android:name=~qcom.mopub.mobileads.MraidActivity~q
		  android:configChanges=~qkeyboardHidden|orientation|screenSize~q />
	<activity android:name=~qcom.mopub.mobileads.MraidVideoPlayerActivity~q
		  android:configChanges=~qkeyboardHidden|orientation|screenSize~q />

	<activity android:name=~qorg.nexage.sourcekit.mraid.MRAIDBrowser~q
		  android:configChanges=~qorientation|keyboard|keyboardHidden|screenSize~q
		  android:theme=~q@android:style/Theme.Translucent~q />


	<activity android:name=~qcom.amazon.device.ads.AdActivity~q android:configChanges=~qkeyboardHidden|orientation|screenSize~q/>

	<activity android:name=~qcom.my.target.ads.MyTargetActivity~q android:configChanges=~qkeyboard|keyboardHidden|orientation|screenLayout|uiMode|screenSize|smallestScreenSize~q/>

	<activity android:name=~qorg.nexage.sourcekit.vast.activity.VASTActivity~q
		  android:theme=~q@android:style/Theme.NoTitleBar.Fullscreen~q />

	<activity android:name=~qorg.nexage.sourcekit.vast.activity.VPAIDActivity~q
		  android:theme=~q@android:style/Theme.NoTitleBar.Fullscreen~q />

	<activity android:name=~qcom.appodeal.ads.networks.vpaid.VPAIDActivity~q
		  android:theme=~q@android:style/Theme.NoTitleBar.Fullscreen~q />

	<activity android:name=~qcom.appodeal.ads.networks.SpotXActivity~q
		  android:theme=~q@android:style/Theme.NoTitleBar.Fullscreen~q/>
	<activity android:name=~qcom.facebook.ads.InterstitialAdActivity~q android:configChanges=~qkeyboardHidden|orientation|screenSize~q />

	<activity android:name=~qcom.unity3d.ads.adunit.AdUnitActivity~q
		android:configChanges=~qfontScale|keyboard|keyboardHidden|locale|mnc|mcc|navigation|orientation|screenLayout|screenSize|smallestScreenSize|uiMode|touchscreen~q
		android:theme=~q@android:style/Theme.NoTitleBar.Fullscreen~q android:hardwareAccelerated=~qtrue~q />
	<activity android:name=~qcom.unity3d.ads.adunit.AdUnitSoftwareActivity~q
		android:configChanges=~qfontScale|keyboard|keyboardHidden|locale|mnc|mcc|navigation|orientation|screenLayout|screenSize|smallestScreenSize|uiMode|touchscreen~q
		android:theme=~q@android:style/Theme.NoTitleBar.Fullscreen~q android:hardwareAccelerated=~qfalse~q />
	<activity android:name=~qcom.unity3d.ads2.adunit.AdUnitActivity~q
		android:configChanges=~qfontScale|keyboard|keyboardHidden|locale|mnc|mcc|navigation|orientation|screenLayout|screenSize|smallestScreenSize|uiMode|touchscreen~q
		android:theme=~q@android:style/Theme.NoTitleBar.Fullscreen~q android:hardwareAccelerated=~qtrue~q />
	<activity android:name=~qcom.unity3d.ads2.adunit.AdUnitSoftwareActivity~q
		android:configChanges=~qfontScale|keyboard|keyboardHidden|locale|mnc|mcc|navigation|orientation|screenLayout|screenSize|smallestScreenSize|uiMode|touchscreen~q
		android:theme=~q@android:style/Theme.NoTitleBar.Fullscreen~q android:hardwareAccelerated=~qfalse~q />


	<activity android:name=~qcom.jirbo.adcolony.AdColonyOverlay~q
		  android:configChanges=~qkeyboardHidden|orientation|screenSize~q
		  android:theme=~q@android:style/Theme.Translucent.NoTitleBar.Fullscreen~q />
	<activity android:name=~qcom.jirbo.adcolony.AdColonyFullscreen~q
		  android:configChanges=~qkeyboardHidden|orientation|screenSize~q
		  android:theme=~q@android:style/Theme.Black.NoTitleBar.Fullscreen~q />
	<activity android:name=~qcom.jirbo.adcolony.AdColonyBrowser~q
		  android:configChanges=~qkeyboardHidden|orientation|screenSize~q
		  android:theme=~q@android:style/Theme.Black.NoTitleBar.Fullscreen~q />
	<activity android:name=~qcom.vungle.publisher.FullScreenAdActivity~q
		  android:configChanges=~qkeyboardHidden|orientation|screenSize~q
		  android:theme=~q@android:style/Theme.NoTitleBar.Fullscreen~q/>
	<activity android:name=~qcom.startapp.android.publish.list3d.List3DActivity~q
		  android:theme=~q@android:style/Theme~q />
	<activity android:name=~qcom.startapp.android.publish.OverlayActivity~q
		  android:theme=~q@android:style/Theme.Translucent~q
		  android:configChanges=~qorientation|keyboardHidden|screenSize~q />
	<activity android:name=~qcom.startapp.android.publish.FullScreenActivity~q
		  android:theme=~q@android:style/Theme~q
		  android:configChanges=~qorientation|keyboardHidden|screenSize~q />
	<service android:name=~qcom.yandex.metrica.MetricaService~q android:enabled=~qtrue~q
		 android:exported=~qtrue~q android:process=~q:Metrica~q>
		<intent-filter>
			<category android:name=~qandroid.intent.category.DEFAULT~q />
			<action android:name=~qcom.yandex.metrica.IMetricaService~q />
			<data android:scheme=~qmetrica~q />
		</intent-filter>
		<meta-data android:name=~qmetrica:api:level~q android:value=~q44~q />
	</service>
	<receiver android:name=~qcom.yandex.metrica.MetricaEventHandler~q
		  android:enabled=~qtrue~q android:exported=~qtrue~q>
		<intent-filter>
			<action android:name=~qcom.android.vending.INSTALL_REFERRER~q />
		</intent-filter>
	</receiver>
	<activity android:name=~qcom.yandex.mobile.ads.AdActivity~q
		  android:configChanges=~qkeyboard|keyboardHidden|orientation|screenLayout|uiMode|screenSize|smallestScreenSize~q />

	<activity android:name=~qcom.flurry.android.FlurryFullscreenTakeoverActivity~q
		  android:configChanges=~qkeyboard|keyboardHidden|orientation|screenLayout|uiMode|screenSize|smallestScreenSize~q />

	<activity android:name=~qcom.appodeal.ads.VideoPlayerActivity~q android:theme=~q@android:style/Theme.Black.NoTitleBar.Fullscreen~q/>

	<activity android:name=~qcom.revmob.FullscreenActivity~q android:theme=~q@android:style/Theme.Translucent~q
		android:configChanges=~qkeyboardHidden|orientation~q/>

	<activity android:name=~qcom.tapjoy.TJAdUnitActivity~q android:configChanges=~qorientation|keyboardHidden|screenSize~q
				android:hardwareAccelerated=~qtrue~q android:theme=~q@android:style/Theme.Translucent.NoTitleBar.Fullscreen~q />
	<activity android:name=~qcom.tapjoy.mraid.view.ActionHandler~q android:configChanges=~qorientation|keyboardHidden|screenSize~q />
	<activity android:name=~qcom.tapjoy.mraid.view.Browser~q android:configChanges=~qorientation|keyboardHidden|screenSize~q />
	<activity android:name=~qcom.tapjoy.TJContentActivity~q android:configChanges=~qorientation|keyboardHidden|screenSize~q
				android:theme=~q@android:style/Theme.Translucent.NoTitleBar~q android:hardwareAccelerated=~qtrue~q />"

#Elseif TARGET="ios"

Import "native/appodeal.ios.cpp"

#end 
Extern

Class AdAppodeal Extends Null="BBAppodeal"

	Function GetAppodeal:AdAppodeal()
		
	Method initialize:Void(appKey:String,adType:Int)
	Method show:Bool(adType:Int)
	Method show:Bool(adType:Int, placement:String)
	Method cache:Void(adType:Int)
	Method hide:Void(adType:Int)
	Method confirm:Void(adType:Int)
	Method isLoaded:Bool(adType:Int)
	Method isPrecache:Bool(adType:Int)
	Method setAutoCache:Void(adType:Int,state:Bool)
	Method setTriggerOnLoadedOnPrecache:Void(adType:Int,state:Bool)
	Method disableNetwork:Void(network:String)
	Method disableNetwork:Void(network:String,adType:Int)
	Method disableLocationPermissionCheck:Void()
	Method disableWriteExternalStoragePermissionCheck:Void()
	Method setTesting:Void(state:Bool)
	Method setLogLevel:Void(level:String)
	Method setCustomRule:Void(name:String,value:Bool)
	Method setCustomRule:Void(name:String,value:Int)
	Method setCustomRule:Void(name:String,value:String)
	Method setCustomRule:Void(name:String,value:Float)
	Method requestAndroidMPermissions:Void()
	Method set728x90Banners:Void(state:Bool)
	Method setBannerAnimation:Void(state:Bool)
	Method setSmartBanners:Void(state:Bool)
	Method trackInAppPurchase:Void(amount:Float,currency:String)
	Method getUserSettings:AdUserSettings()
	Method setBannerCallbacks:Void(callbacks:AdBannerCallbacks)
	Method setInterstitialCallbacks(callbacks:AdInterstitialCallbacks)
	Method setNonSkippableVideoCallbacks(callbacks:AdNonSkippableVideoCallbacks)
	Method setRewardedVideoCallbacks(callbacks:AdRewardedVideoCallbacks)
	
	Method showToast:Void(message:String)

End

Extern
Class AdUserSettings Extends Null="BBUserSettings"
	
	Method setAge:Void(age:Int)
	Method setAlcohol:Void(alcohol:Int)
	Method setBirthday:Void(bday:String)
	Method setEmail:Void(email:String)
	Method setGender:Void(gender:Int)
	Method setInterests:Void(interests:String)
	Method setOccupation:Void(occupation:Int)
	Method setRelation:Void(relation:Int)
	Method setSmoking:Void(smoking:Int)
	Method setUserId:Void(userId:String)
	
End

Extern
Class AdBannerCallbacks Extends Null="BBBannerCallbacks"
	Method onBannerClicked:Void() Abstract
	Method onBannerFailedToLoad:Void() Abstract
	Method onBannerLoaded:Void(height:Int, isPrecache:Bool) Abstract
	Method onBannerShown:Void() Abstract
End

Extern
Class AdInterstitialCallbacks Extends Null="BBInterstitialCallbacks"
	Method onInterstitialClicked:Void() Abstract
	Method onInterstitialClosed:Void() Abstract
	Method onInterstitialLoaded:Void(isPrecache:Bool) Abstract
	Method onInterstitialFailedToLoad:Void() Abstract
	Method onInterstitialShown:Void() Abstract
	Method onInterstitialFinished:Void() Abstract
End

Extern
Class AdNonSkippableVideoCallbacks Extends Null="BBNonSkippableVideoCallbacks"
	Method onNonSkippableVideoClosed:Void(finished:Bool) Abstract
	Method onNonSkippableVideoFailedToLoad:Void() Abstract
	Method onNonSkippableVideoFinished:Void() Abstract
	Method onNonSkippableVideoLoaded:Void() Abstract
	Method onNonSkippableVideoShown:Void() Abstract
End

Extern

Extern
Class AdRewardedVideoCallbacks Extends Null="BBRewardedVideoCallbacks"
	Method onRewardedVideoClosed:Void(finished:Bool) Abstract
	Method onRewardedVideoFailedToLoad:Void() Abstract
	Method onRewardedVideoFinished:Void(amount:Int,name:String) Abstract
	Method onRewardedVideoLoaded:Void() Abstract
	Method onRewardedVideoShown:Void() Abstract
End

Public
Class AdType
	Const NONE:=0
	Const INTERSTITIAL:=3
	Const BANNER:=4
	Const BANNER_BOTTOM:=8
	Const BANNER_TOP:=16
	Const REWARDED_VIDEO:=128
	Const NON_SKIPPABLE_VIDEO:=128
End

Public
Class AdLogLevel
	Const none := "none"
	Const debug := "debug"
	Const verbose := "verbose"
End

Public
Class AdAlcohol
	Const NEUTRAL:=0
	Const NEGATIVE:=1
	Const POSITIVE:=2
End

Public
Class AdSmoking
	Const NEUTRAL:=0
	Const NEGATIVE:=1
	Const POSITIVE:=2
End

Public
Class AdGender
	Const FEMALE:=0
	Const MALE:=1
	Const OTHER:=2
End

Public
Class AdOccupation
	Const OTHER:=0
	Const SCHOOL:=1
	Const UNIVERSITY:=2
	Const WORK:=3
End

Public
Class AdRelation
	Const DATING:=0
	Const ENGAGED:=1
	Const MARRIED:=2
	Const OTHER:=3
	Const SEARCHING:=4
	Const SINGLE:=5
End