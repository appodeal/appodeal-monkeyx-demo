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
	Field windowWidth:Int
	Field windowHeight:Int
	Field buttonWidth:=200
	Field buttonHeight:=150
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
		  Appodeal.initialize("fee50c333ff3825fd6ad6d38cff78154de3025546d47a84f", AdType.BANNER | AdType.SKIPPABLE_VIDEO | AdType.INTERSTITIAL | AdType.REWARDED_VIDEO)
		End If
		
		If buttonBannerShow.hit
		  Appodeal.show(AdType.BANNER_BOTTOM, "bottom_banner")
		End If
		
		If buttonBannerHide.hit		
		  Appodeal.hide(AdType.BANNER)
		  Appodeal.setCustomSegment("segment", True)
		End If
		
		If buttonInterstitial.hit
		  Appodeal.show(AdType.INTERSTITIAL)
		  Appodeal.setCustomSegment("segment", 32)
		End If
		
		If buttonVideo.hit
		  Appodeal.show(AdType.SKIPPABLE_VIDEO)
		  Appodeal.setCustomSegment("segment", 32.5)
		End If
		
		If buttonRewardedVideo.hit
		  Appodeal.show(AdType.REWARDED_VIDEO)
		  Appodeal.setCustomSegment("segment", "custom")
		End If
		
		Return 0		
	End Method
	
	Method OnRender:Int()
		Cls(255, 0, 0)
		widgets.RenderAll()
		Return 0	
	End Method

End Class
