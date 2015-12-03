#If TARGET<>"android" And TARGET<>"ios"
#Error "The Admob module is only available on the android and ios targets"
#End

#If TARGET="android"

Import "native/appodeal.android.java"

#LIBS+="${CD}/native/android/android-support-v4-22.2.1.jar"
#LIBS+="${CD}/native/android/appodeal-1.13.7.jar"
#LIBS+="${CD}/native/android/google-play-services.jar"
#LIBS+="${CD}/native/android/inmobi-5.0.1.jar"
#LIBS+="${CD}/native/android/yandex-metrica-android-2.00.jar"

#ANDROID_MANIFEST+="<uses-permission android:name=~qandroid.permission.ACCESS_NETWORK_STATE~q /><uses-permission android:name=~qandroid.permission.INTERNET~q /><uses-permission android:name=~qandroid.permission.ACCESS_COARSE_LOCATION~q /><uses-permission android:name=~qandroid.permission.WRITE_EXTERNAL_STORAGE~q />"
#ANDROID_MANIFEST_APPLICATION+="
  <meta-data android:name=~qcom.appodeal.framework~q android:value=~qmonkey~q />
  <activity android:name=~qcom.appodeal.ads.InterstitialActivity~q
            android:configChanges=~qorientation|screenSize~q
            android:theme=~q@android:style/Theme.Translucent.NoTitleBar~q />
  <activity android:name=~qcom.appodeal.ads.VideoActivity~q
            android:configChanges=~qorientation|screenSize~q
            android:theme=~q@android:style/Theme.Translucent.NoTitleBar~q />
  <activity android:name=~qcom.appodeal.ads.LoaderActivity~q
            android:configChanges=~qorientation|screenSize~q
            android:theme=~q@android:style/Theme.Translucent.NoTitleBar~q />
  <meta-data android:name=~qcom.google.android.gms.version~q android:value=~q7895000~q />
  <activity android:name=~qcom.google.android.gms.ads.AdActivity~q
            android:configChanges=~qkeyboard|keyboardHidden|orientation|screenLayout|uiMode|screenSize|smallestScreenSize~q
            android:theme=~q@android:style/Theme.Translucent~q />
  <activity android:name=~qcom.chartboost.sdk.CBImpressionActivity~q
            android:theme=~q@android:style/Theme.Translucent~q 
            android:excludeFromRecents=~qtrue~q />
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
  <activity android:name=~qru.mail.android.mytarget.ads.MyTargetActivity~q android:configChanges=~qkeyboard|keyboardHidden|orientation|screenLayout|uiMode|screenSize|smallestScreenSize~q/>
  <activity android:name=~qorg.nexage.sourcekit.vast.activity.VASTActivity~q
            android:theme=~q@android:style/Theme.NoTitleBar.Fullscreen~q />
  <activity android:name=~qcom.facebook.ads.InterstitialActivity~q android:configChanges=~qkeyboardHidden|orientation|screenSize~q />
  <activity android:name=~qcom.unity3d.ads.android.view.UnityAdsFullscreenActivity~q
            android:configChanges=~qfontScale|keyboard|keyboardHidden|locale|mnc|mcc|navigation|orientation|screenLayout|screenSize|smallestScreenSize|uiMode|touchscreen~q
            android:theme=~q@android:style/Theme.NoTitleBar.Fullscreen~q android:hardwareAccelerated=~qtrue~q />
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
    <meta-data android:name=~qmetrica:api:level~q android:value=~q32~q />
  </service>
  <receiver android:name=~qcom.yandex.metrica.MetricaEventHandler~q
            android:enabled=~qtrue~q android:exported=~qtrue~q>
    <intent-filter>
      <action android:name=~qcom.android.vending.INSTALL_REFERRER~q />
    </intent-filter>
  </receiver>
  <activity android:name=~qcom.yandex.metrica.ads.AdActivity~q
            android:configChanges=~qkeyboard|keyboardHidden|orientation|screenLayout|uiMode|screenSize|smallestScreenSize~q />
  <activity android:name=~qcom.inmobi.rendering.InMobiAdActivity~q
            android:configChanges=~qkeyboardHidden|orientation|keyboard|smallestScreenSize|screenSize~q
            android:theme=~q@android:style/Theme.Translucent.NoTitleBar~q android:hardwareAccelerated=~qtrue~q />
  <receiver android:name=~qcom.inmobi.commons.core.utilities.uid.ImIdShareBroadCastReceiver~q
            android:enabled=~qtrue~q android:exported=~qtrue~q >
    <intent-filter>
      <action android:name=~qcom.inmobi.share.id~q />
    </intent-filter>
  </receiver>
  <service android:enabled=~qtrue~q android:name=~qcom.inmobi.signals.activityrecognition.ActivityRecognitionManager~q />"

#Elseif TARGET="ios"

Import "native/appodeal.ios.cpp"

#end 

Extern

Class AdAppodeal Extends Null="BBAppodeal"

	Function GetAppodeal:AdAppodeal()
		
	Method initialize:Void(appKey:String,adType:Int)
	Method show:Bool(adType:Int)
	Method showWithPriceFloor:Bool(adType:Int)
	Method cache:Void(adType:Int)
	Method hide:Void(adType:Int)
	Method isLoaded:Bool(adType:Int)
	Method isLoadedWithPriceFloor:Bool(adType:Int)
	Method isPrecache:Bool(adType:Int)
	Method setAutoCache:Void(adType:Int,state:Bool)
	Method setOnLoadedTriggerBoth:Void(adType:Int,state:Bool)
	Method disableNetwork:Void(network:String)
	Method disableNetwork:Void(network:String,adType:Int)
	Method disableLocationPermissionCheck:Void()
	Method setTesting:Void(state:Bool)
	Method setLogging:Void(state:Bool)

End

Public
Class AdType
    Const NONE:=0
	Const INTERSTITIAL:=1
	Const VIDEO:=2
	Const BANNER:=4
	Const BANNER_BOTTOM:=8
	Const BANNER_TOP:=16
	Const BANNER_CENTER:=32
	Const REWARDED_VIDEO:=128
	Const ALL:=255
	Const ANY:=255
End