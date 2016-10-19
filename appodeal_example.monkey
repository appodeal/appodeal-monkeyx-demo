#ANDROID_APP_LABEL="Appodeal Test"
#ANDROID_APP_PACKAGE="com.appodeal.test"
#ANDROID_SCREEN_ORIENTATION="portrait"
#ANDROID_VERSION_CODE="1"
#ANDROID_VERSION_NAME="1.0"
#ANDROID_KEY_STORE="Appodeal.jks"
#ANDROID_KEY_ALIAS="Key"
#ANDROID_KEY_STORE_PASSWORD="12345678"
#ANDROID_KEY_ALIAS_PASSWORD="12345678"

Strict

Import mojo
Import appodeal

Import SimpleUI.common
Import SimpleUI.widgetManager
Import SimpleUI.Scrollers
Import SimpleUI.panel

Class MyBannerCallbacks Extends AdBannerCallbacks
	Method onBannerClicked:Void()
		AdAppodeal.GetAppodeal().showToast("Clicked")
	End
	Method onBannerFailedToLoad:Void()
		AdAppodeal.GetAppodeal().showToast("failed to load")
	End
	Method onBannerLoaded:Void(height:Int, isPrecache:Bool)
		AdAppodeal.GetAppodeal().showToast("banner loaded. height: " + height + ", precache: " + String(Int(isPrecache)))
	End
	Method onBannerShown:Void()
		AdAppodeal.GetAppodeal().showToast("banner shown")
	End
End

Class MyInterstitialCallbacks Extends AdInterstitialCallbacks
	Method onInterstitialClicked:Void()
		AdAppodeal.GetAppodeal().showToast("interstitial clicked")
	End
	Method onInterstitialClosed:Void()
		AdAppodeal.GetAppodeal().showToast("interstitial closed")
	End
	Method onInterstitialLoaded:Void(isPrecache:Bool)
		AdAppodeal.GetAppodeal().showToast("interstitial loaded. precache: " + String(Int(isPrecache)))
	End
	Method onInterstitialFailedToLoad:Void()
		AdAppodeal.GetAppodeal().showToast("interstitial failed to load")
	End
	Method onInterstitialShown:Void()
		AdAppodeal.GetAppodeal().showToast("interstitial shown")
	End
End

Class MySkippableCallbacks Extends AdSkippableVideoCallbacks
	Method onSkippableVideoClosed:Void(finished:Bool)
		AdAppodeal.GetAppodeal().showToast("skippable video closed. finished: " + String(Int(finished)))
	End
	Method onSkippableVideoFailedToLoad:Void()
		AdAppodeal.GetAppodeal().showToast("skippable video failed to load")
	End
	Method onSkippableVideoFinished:Void()
		AdAppodeal.GetAppodeal().showToast("skippable video finished")
	End
	Method onSkippableVideoLoaded:Void()
		AdAppodeal.GetAppodeal().showToast("skippable video loaded")
	End
	Method onSkippableVideoShown:Void()
		AdAppodeal.GetAppodeal().showToast("skippable video shown")
	End
End

Class MyRewardedCallbacks Extends AdRewardedVideoCallbacks
	Method onRewardedVideoClosed:Void(finished:Bool) 
		AdAppodeal.GetAppodeal().showToast("rewarded video closed. finished: " + String(Int(finished)))
	End
	Method onRewardedVideoFailedToLoad:Void() 
		AdAppodeal.GetAppodeal().showToast("rewarded video failed to load")
	End
	Method onRewardedVideoFinished:Void(amount:Int,name:String) 
		AdAppodeal.GetAppodeal().showToast("rewarded video finished. amount: " + amount +", name: " + name)
	End
	Method onRewardedVideoLoaded:Void()
		AdAppodeal.GetAppodeal().showToast("rewarded video loaded")
	End
	Method onRewardedVideoShown:Void() 
		AdAppodeal.GetAppodeal().showToast("rewarded video shown")
	End
End

Function Main:Int()
	New Game()
	Return 0
End Function

Class Game Extends App
	Field widgets:WidgetManager
	Field buttonInit:PushButton
	Field buttonBannerShow:PushButton
	Field buttonBannerHide:PushButton
	Field buttonInterstitial:PushButton
	Field buttonVideo:PushButton
	Field buttonRewardedVideo:PushButton
	Field Cursor:= New MousePointer()
	Field Appodeal:AdAppodeal
	Field userSettings:AdUserSettings
	Field bannerCallbacks:MyBannerCallbacks = New MyBannerCallbacks
	Field interstitialCallbacks:MyInterstitialCallbacks = New MyInterstitialCallbacks
	Field skippableCallbacks:MySkippableCallbacks = New MySkippableCallbacks
	Field rewardedCallbacks:MyRewardedCallbacks = New MyRewardedCallbacks
	Field windowWidth:Int
	Field windowHeight:Int
	Field buttonWidth:=200
	Field buttonHeight:=100
	Field buttonMargin:=10
	
	Method OnCreate:Int()
		SetUpdateRate 60
		
		Appodeal = Appodeal.GetAppodeal()
		
		widgets = New WidgetManager(Cursor)
		
		windowWidth = DeviceWidth()
		windowHeight = DeviceHeight()
		buttonWidth = windowWidth - 20
		
		buttonInit = New PushButton(10, 0 * (buttonHeight + buttonMargin), buttonWidth, buttonHeight, Cursor)
		buttonBannerShow = New PushButton(10, 1 * (buttonHeight + buttonMargin), buttonWidth, buttonHeight, Cursor)
		buttonBannerHide = New PushButton(10, 2 * (buttonHeight + buttonMargin), buttonWidth, buttonHeight, Cursor)
		buttonInterstitial = New PushButton(10, 3 * (buttonHeight + buttonMargin), buttonWidth, buttonHeight, Cursor)
		buttonVideo = New PushButton(10, 4 * (buttonHeight + buttonMargin), buttonWidth, buttonHeight, Cursor)
		buttonRewardedVideo = New PushButton(10, 5 * (buttonHeight + buttonMargin), buttonWidth, buttonHeight, Cursor)
		
		buttonInit.Text = "Init"
		buttonBannerShow.Text = "Banner show"
		buttonBannerHide.Text = "Banner hide"
		buttonInterstitial.Text = "Interstitial"
		buttonVideo.Text = "Skippable Video"
		buttonRewardedVideo.Text = "Rewarded Video"
		
		widgets.Attach(buttonInit)
		widgets.Attach(buttonBannerShow)
		widgets.Attach(buttonBannerHide)
		widgets.Attach(buttonInterstitial)
		widgets.Attach(buttonVideo)
		widgets.Attach(buttonRewardedVideo)

		Return 0
	End Method
	
	Method OnUpdate:Int()				
		If KeyHit(KEY_ESCAPE) or KeyHit(KEY_CLOSE) or KeyHit(KEY_BACK) Then Error("")
		
		Cursor.Poll()	
		widgets.PollAll()
		
		If buttonInit.hit
		  'Appodeal.initialize("dee74c5129f53fc629a44a690a02296694e3eef99f2d3a5f")
		  Appodeal.confirm(AdType.SKIPPABLE_VIDEO)
		  
		  Appodeal.setLogLevel(AdLogLevel.verbose)
		  Appodeal.setSmartBanners(False)
		  Appodeal.set728x90Banners(False)
		  Appodeal.setBannerAnimation(True)
		  
		  userSettings = Appodeal.getUserSettings()
		  userSettings.setAge(25)
		  userSettings.setBirthday("17/06/1990")
		  userSettings.setEmail("hi@appodeal.com")
		  userSettings.setGender(AdGender.FEMALE)
		  userSettings.setInterests("reading, games, movies, snowboarding")
		  userSettings.setOccupation(AdOccupation.WORK)
		  userSettings.setRelation(AdRelation.DATING)
		  userSettings.setAlcohol(AdAlcohol.NEGATIVE)
		  userSettings.setSmoking(AdSmoking.NEGATIVE)
		  
		  Appodeal.setBannerCallbacks(bannerCallbacks)
		  Appodeal.setInterstitialCallbacks(interstitialCallbacks)
		  Appodeal.setSkippableVideoCallbacks(skippableCallbacks)
		  Appodeal.setRewardedVideoCallbacks(rewardedCallbacks)
		  
		  Appodeal.initialize("fee50c333ff3825fd6ad6d38cff78154de3025546d47a84f", AdType.BANNER | AdType.SKIPPABLE_VIDEO | AdType.INTERSTITIAL | AdType.REWARDED_VIDEO)
		End If
		
		If buttonBannerShow.hit
		  Appodeal.show(AdType.BANNER_BOTTOM, "bottom_banner")
		End If
		
		If buttonBannerHide.hit		
		  Appodeal.hide(AdType.BANNER)
		  Appodeal.setCustomRule("segment", True)
		End If
		
		If buttonInterstitial.hit
		  Appodeal.show(AdType.INTERSTITIAL)
		  Appodeal.setCustomRule("segment", 32)
		End If
		
		If buttonVideo.hit
		  Appodeal.show(AdType.SKIPPABLE_VIDEO)
		  Appodeal.setCustomRule("segment", 32.5)
		End If
		
		If buttonRewardedVideo.hit
		  Appodeal.show(AdType.REWARDED_VIDEO)
		  Appodeal.setCustomRule("segment", "custom")
		End If
		
		Return 0		
	End Method
	
	Method OnRender:Int()
		Cls(255, 0, 0)
		widgets.RenderAll()
		Return 0	
	End Method

End Class
