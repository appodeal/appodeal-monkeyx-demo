# Appodeal Monkey X plugin

This is official Appodeal Monkey X plugin

# iOS Instructions

See here: https://github.com/appodeal/appodeal-monkey-x-ios-plugin

# Android Instructions

See below: 

## Monkey X Android Integration

### Monkey X Version
This example was tested with versions MonkeyXPro78h and MonkeyXPro87b.

### ANDROID_HOME
Building library files requires the ANDROID_HOME enviroment variable to be set. Search Google for instructions on setting this up properly for your OS. If you have an IDE such as Jungle open you will need to restart it after setting up ANDROID_HOME.

### Android API Versions
The android-support-v4_lib and google-play-services_lib folders have API level 23 defined. If you do not have this version installed you must change these defined versions to one you do have or you must install 23. There are 5 project.properties files in total you must edit in the lib folders.

### SDK and plugin integration
From this example, place `android-support-v4_lib`, `google-play-services_lib`, `native` folders and `appodeal.monkey` file to your project's root folder. If you wish to place them elsewhere you must edit the android-library.reference lines below to have the correct path.

### Build process
To build application with all dependencies you need to run buid process as usual. It will be failed with the following error:
```
Error: No resource found that matches the given name (at 'value' with value '@integer/google_play_services_version')
```
That's fine. After that open `build\android\templates\project.properties` file with any text editor and add the following lines:
```
android.library.reference.1=../../google-play-services_lib/play-services-ads-9.8.0
android.library.reference.2=../../google-play-services_lib/play-services-ads-lite-9.8.0
android.library.reference.3=../../google-play-services_lib/play-services-base-9.8.0
android.library.reference.4=../../google-play-services_lib/play-services-basement-9.8.0
android.library.reference.5=../../android-support-v4_lib
```

Now you should be able to build your project without any problems.

### Optional modifications

If you wish to not add these lines each time you remake the build folder you can edit a project appropriate .monkey file to include the lines:
```
#ANDROID_LIBRARY_REFERENCE_1="android.library.reference.1=../../google-play-services_lib/play-services-ads-9.8.0"
#ANDROID_LIBRARY_REFERENCE_2="android.library.reference.2=../../google-play-services_lib/play-services-ads-lite-9.8.0"
#ANDROID_LIBRARY_REFERENCE_3="android.library.reference.3=../../google-play-services_lib/play-services-base-9.8.0"
#ANDROID_LIBRARY_REFERENCE_4="android.library.reference.4=../../google-play-services_lib/play-services-basement-9.8.0"
#ANDROID_LIBRARY_REFERENCE_5="android.library.reference.5=../../android-support-v4_lib"
```
Then you must edit the project.properties of your Android target template to include additional references as by default it only includes two. For example, edit: \MonkeyXPro87b\targets\android\template\templates\project.properties to include the lines on the bottom to include the five or more references so that they can be properly replaced when you make clean builds:
```
${ANDROID_LIBRARY_REFERENCE_1}
${ANDROID_LIBRARY_REFERENCE_2}
${ANDROID_LIBRARY_REFERENCE_3}
${ANDROID_LIBRARY_REFERENCE_4}
${ANDROID_LIBRARY_REFERENCE_5}
```


### Ad types
AdType.INTERSTITIAL

AdType.SKIPPABLE_VIDEO

AdType.REWARDED_VIDEO

AdType.NON_SKIPPABLE_VIDEO

AdType.BANNER

Ad types can be combined using "|" operator. For example AdType.INTERSTITIAL | AdType.SKIPPABLE_VIDEO

Note that it is better to use NON_SKIPPABLE_VIDEO or REWARDED_VIDEO, but if you are sure you want to use SKIPPABLE_VIDEO you must confirm usage by calling appodeal.confirm(AdType.SKIPPABLE_VIDEO) before SDK initialization

### SDK initialization
First import appodeal module to your project:
```
Import appodeal
```
To initialize SDK you need to add following code in OnCreate method of your app:
```
Appodeal = AdAppodeal.GetAppodeal()
String appKey = "fee50c333ff3825fd6ad6d38cff78154de3025546d47a84f"
Appodeal.initialize(appKey, AdType.INTERSTITIAL | AdType.BANNER)
```
To initialize only interstitials use Appodeal.initialize(appKey, AdType.INTERSTITIAL)

To initialize only skippable videos use Appodeal.initialize(appKey, AdType.SKIPPABLE_VIDEO)

To initialize only rewarded video use Appodeal.initialize(appKey, AdType.REWARDED_VIDEO)

To initialize only non-skippable video use Appodeal.initialize(appKey, AdType.NON_SKIPPABLE_VIDEO)

To initialize interstitials and videos use Appodeal.initialize(appKey, AdType.INTERSTITIAL | AdType.SKIPPABLE_VIDEO)

To initialize only banners use Appodeal.initialize(appKey, AdType.BANNER)
### Display ad
```
Appodeal.show(AdType)
```
show() returns a boolean value indicating whether show call was passed to appropriate SDK

To display interstitial use Appodeal.show(AdType.INTERSTITIAL)

To display skippable video use Appodeal.show(AdType.SKIPPABLE_VIDEO)

To display rewarded video use Appodeal.show(AdType.REWARDED_VIDEO)

To display non-skippable video use Appodeal.show(AdType.NON_SKIPPABLE_VIDEO)

To display interstitial or video use Appodeal.show(AdType.INTERSTITIAL | AdType.SKIPPABLE_VIDEO)

To display banner at the bottom of the screen use Appodeal.show(AdType.BANNER_BOTTOM)

To display banner at the top of the screen use Appodeal.show(AdType.BANNER_TOP)

To display banner at the center of the screen use Appodeal.show(AdType.BANNER_CENTER)

To display banner in the view specified in layout file use Appodeal.show(AdType.BANNER_VIEW)

### Hiding banner
To hide banner you need to call the following code:
```
Appodeal.hide(AdType.BANNER)
```

### Samples
#### Display interstitial after app launch
```
Appodeal.initialize(appKey, AdType.INTERSTITIAL)
Appodeal.show(AdType.INTERSTITIAL)
```
#### Display interstitial after it was loaded
```
Class MyInterstitialCallbacks Extends AdInterstitialCallbacks
	Method onInterstitialClicked:Void()
	End
	Method onInterstitialClosed:Void()
	End
	Method onInterstitialLoaded:Void(isPrecache:Bool)
		AdAppodeal.GetAppodeal().show(AdType.INTERSTITIAL)
	End
	Method onInterstitialFailedToLoad:Void()
	End
	Method onInterstitialShown:Void()
	End
End
...
Field interstitialCallbacks:MyInterstitialCallbacks = New MyInterstitialCallbacks
...
Appodeal = AdAppodeal.GetAppodeal()
Appodeal.setAutoCache(AdType.INTERSTITIAL, False)
Appodeal.initialize(appKey, AdType.INTERSTITIAL)
Appodeal.setInterstitialCallbacks(interstitialCallbacks)
Appodeal.cache(AdType.INTERSTITIAL)
```
`Note: showing fullscreen ads immediately after app launch doesn't allowed. Also, if an ad has not uploaded yet, you will see a loader, which will be disappeared after few seconds`

### Advanced features
#### Enabling test mode
```
Appodeal.setTesting(true)
```
In test mode test ads will be shown and debug data will be written to logcat
#### Enabling logging
Enable debug logging to logcat using tag "Appodeal"
```
Appodeal.setLogLevel(AdLogLevel.verbose)
```
#### Checking if ad is loaded
```
Appodeal.isLoaded(AdType)
```
To check if interstitial is loaded use Appodeal.isLoaded(AdType.INTERSTITIAL)

To check if skippable video is loaded use Appodeal.isLoaded(AdType.SKIPPABLE_VIDEO)

To check if rewarded video is loaded use Appodeal.isLoaded(AdType.REWARDED_VIDEO)

To check if non-skippable video is loaded use Appodeal.isLoaded(AdType.NON_SKIPPABLE_VIDEO)

To check if banner is loaded use Appodeal.isLoaded(AdType.BANNER)

#### Checking if loaded ad is precache
```
Appodeal.isPrecache(AdType)
```
Currently supported only for interstitials and banners.

#### Setting Interstitial callbacks
Create new class, which is extends AdInterstitialCallbacks:
```
Class MyInterstitialCallbacks Extends AdInterstitialCallbacks
	Method onInterstitialClicked:Void()
	End
	Method onInterstitialClosed:Void()
	End
	Method onInterstitialLoaded:Void(isPrecache:Bool)
	End
	Method onInterstitialFailedToLoad:Void()
	End
	Method onInterstitialShown:Void()
	End
End
```
Create instance of your class and pass it to setInterstitialCallbacks method:
```
Appodeal.setInterstitialCallbacks(interstitialCallbacks)
```

#### Setting skippable video callbacks
Create new class, which is extends AdSkippableVideoCallbacks:
```
Class MySkippableCallbacks Extends AdSkippableVideoCallbacks
	Method onSkippableVideoClosed:Void()
	End
	Method onSkippableVideoFailedToLoad:Void()
	End
	Method onSkippableVideoFinished:Void()
	End
	Method onSkippableVideoLoaded:Void()
	End
	Method onSkippableVideoShown:Void()
	End
End
```
Create instance of your class and pass it to setSkippableVideoCallbacks method:
```
Appodeal.setSkippableVideoCallbacks(skippableCallbacks)
```

#### Setting rewarded video callbacks
Create new class, which is extends AdRewardedVideoCallbacks:
```
Class MyRewardedCallbacks Extends AdRewardedVideoCallbacks
	Method onRewardedVideoClosed:Void() 
	End
	Method onRewardedVideoFailedToLoad:Void() 
	End
	Method onRewardedVideoFinished:Void(amount:Int,name:String) 
	End
	Method onRewardedVideoLoaded:Void()
	End
	Method onRewardedVideoShown:Void() 
	End
End
```
Create instance of your class and pass it to setRewardedVideoCallbacks method:
```
Appodeal.setRewardedVideoCallbacks(rewardedCallbacks)
```

#### Setting non-skippable video callbacks
Create new class, which is extends AdNonSkippableVideoCallbacks:
```
Class MyNonSkippableCallbacks Extends AdNonSkippableVideoCallbacks
	Method onNonSkippableVideoClosed:Void()
	End
	Method onNonSkippableVideoFailedToLoad:Void()
	End
	Method onNonSkippableVideoFinished:Void()
	End
	Method onNonSkippableVideoLoaded:Void()
	End
	Method onNonSkippableVideoShown:Void()
	End
End
```
Create instance of your class and pass it to setNonSkippableVideoCallbacks method:
```
Appodeal.setNonSkippableVideoCallbacks(skippableCallbacks)
```

#### Setting banner callbacks
Create new class, which is extends AdBannerCallbacks:
```
Class MyBannerCallbacks Extends AdBannerCallbacks
	Method onBannerClicked:Void()
	End
	Method onBannerFailedToLoad:Void()
	End
	Method onBannerLoaded:Void(isPrecache:Bool)
	End
	Method onBannerShown:Void()
	End
End
```
Create instance of your class and pass it to setBannerCallbacks method:
```
Appodeal.setBannerCallbacks(bannerCallbacks)
```

#### Manual ad caching
```
Appodeal.cache(adTypes)
```
You should disable automatic caching before SDK initialization using setAutoCache(adTypes, false).

To cache interstitial use Appodeal.cache(AdType.INTERSTITIAL)

To cache skippable video use Appodeal.cache(AdType.SKIPPABLE_VIDEO)

To cache rewarded video use Appodeal.cache(AdType.REWARDED_VIDEO)

To cache non-skippable video use Appodeal.cache(AdType.NON_SKIPPABLE_VIDEO)

To cache interstitial and video use Appodeal.cache(AdType.INTERSTITIAL | AdType.SKIPPABLE_VIDEO)

To cache banner use Appodeal.cache(AdType..BANNER)

#### Enabling or disabling automatic caching
```
Appodeal.setAutoCache(adTypes, False)
```
Should be used before SDK initialization

To disable automatic caching for interstitials use Appodeal.setAutoCache(AdType.INTERSTITIAL, False)

To disable automatic caching for skippable videos use Appodeal.setAutoCache(AdType.SKIPPABLE_VIDEO, False)

To disable automatic caching for rewarded videos use Appodeal.setAutoCache(AdType.REWARDED_VIDEO, False)

To disable automatic caching for non-skippable videos use Appodeal.setAutoCache(AdType.NON_SKIPPABLE_VIDEO, False)

#### Triggering onLoaded callback twice
```
Appodeal.setOnLoadedTriggerBoth(adTypes, True)
```
setOnLoadedTriggerBoth(AdType.INTERSTITIAL, False) - onInterstitialLoaded will trigger only when normal ad was loaded (default).

setOnLoadedTriggerBoth(AdType.INTERSTITIAL, True) - onInterstitialLoaded will trigger twice, both when precache and normal ad were loaded.

Currently supported only for interstitials

Should be used before SDK initialization.

#### Disabling networks
```
Appodeal.disableNetwork(network)
```
Also, it’s possible to disable network only for specific ad types.
```
Appodeal::disableNetwork("networkName", adTypes);
```
Available parameters: "amazon_ads", "applovin", "chartboost", "mopub", "unity_ads", "mailru", "facebook", "adcolony", "vungle", "yandex", "startapp", "avocarrot", "flurry", "pubnative", "cheetah", "inner-active", "revmob".

Should be used before SDK initialization

#### Remove adapters from Project

First of all, it's required  to disable network, which you want to remove.
```
Appodeal.disableNetwork("startapp");
```

After that, you can remove unused jar files from libs folder of Appodeal plugin. Some networks are included in appodeal-x.x.x.jar file. You can open it via an archiver and remove unused dex files from assets/dex folder.
#### Disabling location permission check
To disable toast messages ACCESS_COARSE_LOCATION permission is missing use the following method:
```
Appodeal.disableLocationPermissionCheck()
```
Should be used before SDK initialization.

#### Disabling write external storage permission check

To disable toast messages WRITE_EXTERNAL_STORAGE permission is missing use the following method:

```
Appodeal.disableWriteExternalStoragePermissionCheck()
```

Should be used before SDK initialization.

`Note: some networks don't work without write external storage permission. They will be disabled in your application.`

#### Tracking in-app purchase
```
Appodeal.trackInAppPurchase(amount, currencyCode);
```
Tracks in-app purchase information and sends info to our servers for analytics. Example:
```
Appodeal.trackInAppPurchase(5, "USD");
```

### Setting user data
#### Initialization
Our SDK provides the transfer of user data for better ad targeting and higher eCPM. All parameters are optional and can be defined partially.

To obtain reference to the user settings, please call this before Appodeal initialization:
```
userSettings = Appodeal.GetUserSettings()
```
#### Set the age of the user
Positive integer value.
```
userSettings.setAge(25)
```
#### Set birth date
```
userSettings.setBirthday("17/06/1990")
```
birthday in format "DD/MM/YYYY" or "MM/YYYY" or "YYYY"

#### Set user email
```
userSettings.setEmail("hi@appodeal.com")
```
#### Specify gender of the user
```
userSettings.setGender(AdGender.FEMALE)
```
Possible values: AdGender.FEMALE, AdGender.MALE, AdGender.OTHER

#### Set interests of the user
```
userSettings.setInterests("reading, games, movies, snowboarding")
```

#### Specify occupation of the user
```
userSettings.setOccupation(AdOccupation.WORK)
```
Possible values: AdOccupation.WORK, AdOccupation.UNIVERSITY, AdOccupation.SCHOOL, AdOccupation.Occupation.OTHER

#### Specify marital status of the user
```
userSettings.setRelation(AdRelation.DATING)
```
Possible values: AdRelation.DATING, AdRelation.ENGAGED, AdRelation.MARRIED, AdRelation.SEARCHING, AdRelation.SINGLE, AdRelation.Relation.OTHER

#### Set drinking habits of the user
```
userSettings.setAlcohol(AdAlcohol.NEGATIVE)
```
Possible values: AdAlcohol.NEGATIVE, AdAlcohol.NEUTRAL, AdAlcohol.POSITIVE.

#### User attitude to smoking
```
userSettings.setSmoking(AdSmoking.NEGATIVE)
```
Possible values: AdSmoking.NEGATIVE, AdSmoking.POSITIVE, AdSmoking.NEUTRAL.
