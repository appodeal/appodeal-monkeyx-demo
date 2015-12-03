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
	Field buttonInterstitialOrVideo:PushButton
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
		buttonInterstitialOrVideo = New PushButton(10, 5 * (buttonHeight + buttonMargin), buttonWidth, buttonHeight, Cursor)
		
		buttonInit.Text = "Init"
		buttonBannerShow.Text = "Banner show"
		buttonBannerHide.Text = "Banner hide"
		buttonInterstitial.Text = "Interstitial"
		buttonVideo.Text = "Video"
		buttonInterstitialOrVideo.Text = "Rewarded Video"
		
		widgets.Attach(buttonInit)
		widgets.Attach(buttonBannerShow)
		widgets.Attach(buttonBannerHide)
		widgets.Attach(buttonInterstitial)
		widgets.Attach(buttonVideo)
		widgets.Attach(buttonInterstitialOrVideo)

		Return 0
	End Method
	
	Method OnUpdate:Int()				
		If KeyHit(KEY_ESCAPE) or KeyHit(KEY_CLOSE) or KeyHit(KEY_BACK) Then Error("")
		
		Cursor.Poll()	
		widgets.PollAll()
		
		If buttonInit.hit
		  'Appodeal.initialize("dee74c5129f53fc629a44a690a02296694e3eef99f2d3a5f")
		  Appodeal.initialize("fee50c333ff3825fd6ad6d38cff78154de3025546d47a84f", AdType.ALL)
		End If
		
		If buttonBannerShow.hit
		  Appodeal.show(AdType.BANNER_BOTTOM)
		End If
		
		If buttonBannerHide.hit		
		  Appodeal.hide(AdType.BANNER)
		End If
		
		If buttonInterstitial.hit
		  Appodeal.show(AdType.INTERSTITIAL)
		End If
		
		If buttonVideo.hit
		  Appodeal.show(AdType.VIDEO)
		End If
		
		If buttonInterstitialOrVideo.hit
		  Appodeal.show(AdType.REWARDED_VIDEO)
		End If
		
		Return 0		
	End Method
	
	Method OnRender:Int()
		Cls(255, 0, 0)
		widgets.RenderAll()
		Return 0	
	End Method

End Class
