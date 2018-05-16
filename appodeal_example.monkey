#ANDROID_APP_LABEL="Appodeal Test"
#ANDROID_APP_PACKAGE="com.appodeal.test"
#ANDROID_SCREEN_ORIENTATION="landscape"
#ANDROID_VERSION_CODE="1"
#ANDROID_VERSION_NAME="1.0"
#ANDROID_KEY_STORE="Appodeal.jks"
#ANDROID_KEY_ALIAS="Key"
#ANDROID_KEY_STORE_PASSWORD="12345678"
#ANDROID_KEY_ALIAS_PASSWORD="12345678"

Strict

Import mojo
Import appodeal
Import eazyGadget

Class MyBannerCallbacks Extends AdBannerCallbacks
	Method onBannerClicked:Void()
		AdAppodeal.GetAppodeal().showMessage("Clicked")
	End
	Method onBannerFailedToLoad:Void()
		AdAppodeal.GetAppodeal().showMessage("failed to load")
	End
	Method onBannerLoaded:Void(height:Int, isPrecache:Bool)
		AdAppodeal.GetAppodeal().showMessage("banner loaded, height:" + height + ", precache:" + String(Int(isPrecache)))
	End
	Method onBannerShown:Void()
		AdAppodeal.GetAppodeal().showMessage("banner shown")
	End
End

Class MyInterstitialCallbacks Extends AdInterstitialCallbacks
	Method onInterstitialClicked:Void()
		AdAppodeal.GetAppodeal().showMessage("interstitial clicked")
	End
	Method onInterstitialClosed:Void()
		AdAppodeal.GetAppodeal().showMessage("interstitial closed")
	End
	Method onInterstitialLoaded:Void(isPrecache:Bool)
		AdAppodeal.GetAppodeal().showMessage("interstitial loaded. precache: " + String(Int(isPrecache)))
	End
	Method onInterstitialFailedToLoad:Void()
		AdAppodeal.GetAppodeal().showMessage("interstitial failed to load")
	End
	Method onInterstitialShown:Void()
		AdAppodeal.GetAppodeal().showMessage("interstitial shown")
	End
End

Class MyRewardedCallbacks Extends AdRewardedVideoCallbacks
	Method onRewardedVideoClosed:Void() 
		AdAppodeal.GetAppodeal().showMessage("rewarded video closed")
	End
	Method onRewardedVideoFailedToLoad:Void() 
		AdAppodeal.GetAppodeal().showMessage("rewarded video failed to load")
	End
	Method onRewardedVideoFinished:Void(amount:Int,name:String) 
		AdAppodeal.GetAppodeal().showMessage("rewarded video finished. amount: " + amount +", name: " + name)
	End
	Method onRewardedVideoLoaded:Void()
		AdAppodeal.GetAppodeal().showMessage("rewarded video loaded")
	End
	Method onRewardedVideoShown:Void() 
		AdAppodeal.GetAppodeal().showMessage("rewarded video shown")
	End
End

Function Main:Int()
	New Game()
	Return 0
End Function

Class Game Extends App
	Field adType:ezComboBox
	Field buttonInit:ezButton
	Field buttonCache:ezButton
	Field buttonIsLoaded:ezButton
	Field buttonIsPrecache:ezButton
	Field buttonShow:ezButton
	Field buttonShowWithPlacement:ezButton
	Field buttonHide:ezButton
	Field logging:ezCheckBox
	Field testing:ezCheckBox
	Field confirm:ezCheckBox
	Field autocache:ezCheckBox
	Field disableSmartBanners:ezCheckBox
	Field disableBannerAnimation:ezCheckBox
	Field disable728x90Banners:ezCheckBox
	Field enableTriggerOnLoadedOnPrecache:ezCheckBox
	Field disableLocationPermissionCheck:ezCheckBox
	Field disableWriteExternalStorageCheck:ezCheckBox

	Field Appodeal:AdAppodeal
	Field userSettings:AdUserSettings
	Field bannerCallbacks:MyBannerCallbacks = New MyBannerCallbacks
	Field interstitialCallbacks:MyInterstitialCallbacks = New MyInterstitialCallbacks
	Field rewardedCallbacks:MyRewardedCallbacks = New MyRewardedCallbacks
	Field windowWidth:Int
	Field windowHeight:Int
	Field buttonWidth:=100
	Field buttonHeight:=50
	Field buttonMargin:=10
	Field checkboxesWidth:Int
	
	Method OnCreate:Int()
		SetUpdateRate 60
		
		Appodeal = Appodeal.GetAppodeal()
		
		windowWidth = DeviceWidth()
		windowHeight = DeviceHeight()
		buttonWidth = windowWidth * 0.35
		checkboxesWidth = windowWidth - buttonWidth - 30
		
		adType = New ezComboBox(10, 0 * (buttonHeight + buttonMargin), buttonWidth, buttonHeight)
		adType.AddItem("Select Ad Type")
		adType.AddItem("Banner Top")
		adType.AddItem("Banner Bottom")
		adType.AddItem("Interstitial")
		adType.AddItem("Interstitial or Video")
		adType.AddItem("Rewarded Video")
		buttonInit = New ezButton(10, 1 *(buttonHeight + buttonMargin), buttonWidth, buttonHeight, "Initialize" )
		buttonCache = New ezButton(10, 2 *(buttonHeight + buttonMargin), buttonWidth, buttonHeight, "Cache" )
		buttonIsLoaded = New ezButton(10, 3 *(buttonHeight + buttonMargin), buttonWidth, buttonHeight, "Is Loaded?" )
		buttonIsPrecache = New ezButton(10, 4 *(buttonHeight + buttonMargin), buttonWidth, buttonHeight, "Is Precache?" )
		buttonShow = New ezButton(10, 5 *(buttonHeight + buttonMargin), buttonWidth, buttonHeight, "Show" )
		buttonShowWithPlacement = New ezButton(10, 6 *(buttonHeight + buttonMargin), buttonWidth, buttonHeight, "Show With Placement" )
		buttonHide = New ezButton(10, 7 *(buttonHeight + buttonMargin), buttonWidth, buttonHeight, "Hide" )

		logging = New ezCheckBox(10 + buttonWidth + 10, 0 * (buttonHeight + buttonMargin), checkboxesWidth/2, buttonHeight, "Logging")
		testing = New ezCheckBox(10 + buttonWidth + 10 + checkboxesWidth/2, 0 * (buttonHeight + buttonMargin), checkboxesWidth/2, buttonHeight, "Testing")
		autocache = New ezCheckBox(10 + buttonWidth + 10 + checkboxesWidth/2, 1 * (buttonHeight + buttonMargin), checkboxesWidth, buttonHeight, "Autocache")
		disableSmartBanners = New ezCheckBox(10 + buttonWidth + 10, 2 * (buttonHeight + buttonMargin), checkboxesWidth, buttonHeight, "DisableSmartBanners")
		disableBannerAnimation = New ezCheckBox(10 + buttonWidth + 10, 3 * (buttonHeight + buttonMargin), checkboxesWidth, buttonHeight, "DisableBannerAnimation")
		disable728x90Banners = New ezCheckBox(10 + buttonWidth + 10, 4 * (buttonHeight + buttonMargin), checkboxesWidth, buttonHeight, "Disable 728x90 Banners")
		enableTriggerOnLoadedOnPrecache = New ezCheckBox(10 + buttonWidth + 10, 5 * (buttonHeight + buttonMargin), checkboxesWidth, buttonHeight, "Trigger onLoaded on precache")
		disableLocationPermissionCheck = New ezCheckBox(10 + buttonWidth + 10, 6 * (buttonHeight + buttonMargin), checkboxesWidth, buttonHeight, "Disable Location Permission Check")
		disableWriteExternalStorageCheck = New ezCheckBox(10 + buttonWidth + 10, 7 * (buttonHeight + buttonMargin), checkboxesWidth, buttonHeight, "Disable Write External Storage Ceck")
		
		

		Return 0
	End Method
	
	Method OnUpdate:Int()				
		If KeyHit(KEY_ESCAPE) Or KeyHit(KEY_CLOSE) Or KeyHit(KEY_BACK) Then Error("")
		
		adType.Update()
		logging.Update()
		testing.Update()
		autocache.Update()
		disableSmartBanners.Update()
		disableBannerAnimation.Update()
		disable728x90Banners.Update()
		enableTriggerOnLoadedOnPrecache.Update()
		disableLocationPermissionCheck.Update()
		disableWriteExternalStorageCheck.Update()
		
		If buttonInit.Update()
		  If logging.State() <> 0 Then Appodeal.setLogLevel(AdLogLevel.verbose) Else Appodeal.setLogLevel(AdLogLevel.none)
		  Appodeal.setTesting(Bool(testing.State()))
		  Appodeal.setAutoCache(GetAdType(), Bool(autocache.State()))
		  
		  Appodeal.setSmartBanners(disableSmartBanners.State() = 0)
		  Appodeal.set728x90Banners(disable728x90Banners.State() = 0)
		  Appodeal.setBannerAnimation(disableBannerAnimation.State() = 0)
		  Appodeal.setOnLoadedTriggerBoth(GetAdType(), Bool(enableTriggerOnLoadedOnPrecache.State()))
		  
		  If disableLocationPermissionCheck.State() <> 0 Then Appodeal.disableLocationPermissionCheck()
		  If disableWriteExternalStorageCheck.State() <> 0 Then Appodeal.disableWriteExternalStoragePermissionCheck()
		  
		  userSettings = Appodeal.GetUserSettings()
		  userSettings.setAge(25)
		  userSettings.setUserId("id1")
		  userSettings.setGender(AdGender.FEMALE)
		  
		  Appodeal.setBannerCallbacks(bannerCallbacks)
		  Appodeal.setInterstitialCallbacks(interstitialCallbacks)
		  Appodeal.setRewardedVideoCallbacks(rewardedCallbacks)
		  
		  Appodeal.initialize("fee50c333ff3825fd6ad6d38cff78154de3025546d47a84f", GetAdType())
		  Appodeal.setCustomRule("user_age", 18)
		  Appodeal.setCustomRule("online_time", 5.34)
		  Appodeal.setCustomRule("premium_user", True)
		  Appodeal.setCustomRule("some_string_rule", "value")		  
		End If
		
		If buttonCache.Update()
		  Appodeal.cache(GetAdType())
		End If
		
		If buttonIsLoaded.Update()		
		  Appodeal.showMessage("Is loaded: " + String(Int(Appodeal.isLoaded(GetAdType()))))
		End If
		
		If buttonIsPrecache.Update()
		    Appodeal.showMessage("Is precache: " + String(Int(Appodeal.isPrecache(GetAdType()))))
		End If
		
		If buttonShow.Update()
		  Appodeal.show(GetAdType())
		End If
		
		If buttonShowWithPlacement.Update()
		  Appodeal.show(GetAdType(), "main_menu_placement")
		End If
		
		If buttonHide.Update()
		  Appodeal.hide(GetAdType())
		End If
		
		Return 0		
	End Method
	
	Method GetAdType:Int()
		Select adType.Index()
			Case 1
				Return AdType.BANNER_TOP
			Case 2
				Return AdType.BANNER_BOTTOM
			Case 3
				Return AdType.INTERSTITIAL
			Case 4 
				Return AdType.INTERSTITIAL | AdType.SKIPPABLE_VIDEO
			Case 5
				Return AdType.REWARDED_VIDEO
			Default
				Return 0
		End Select
	End Method
	
	Method OnRender:Int()
		Cls(255, 0, 0)
		buttonInit.Render
		buttonCache.Render
		buttonIsLoaded.Render
		buttonIsPrecache.Render
		buttonShow.Render
		buttonShowWithPlacement.Render
		buttonHide.Render
		adType.Render
		logging.Render
		testing.Render
		autocache.Render
		disableSmartBanners.Render
		disableBannerAnimation.Render
		disable728x90Banners.Render
		enableTriggerOnLoadedOnPrecache.Render
		disableLocationPermissionCheck.Render
		disableWriteExternalStorageCheck.Render
		Return 0	
	End Method

End Class
