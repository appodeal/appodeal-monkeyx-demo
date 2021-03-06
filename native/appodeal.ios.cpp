#import "Appodeal/Appodeal.h"

@interface BannerCallbacks : NSObject <AppodealBannerDelegate> {}

- (void)bannerDidLoadAdIsPrecache:(BOOL)precache;;
- (void)bannerDidRefresh;
- (void)bannerDidFailToLoadAd;
- (void)bannerDidClick;
- (void)bannerDidShow;

@end

@interface InterstitialCallbacks : NSObject <AppodealInterstitialDelegate> {}

- (void)interstitialDidLoadAdisPrecache:(BOOL)precache;
- (void)interstitialDidClick;
- (void)interstitialDidDismiss;
- (void)interstitialWillPresent;
- (void)interstitialDidFailToLoadAd;

@end

@interface NonSkippableVideoCallbacks : NSObject <AppodealNonSkippableVideoDelegate> {}

- (void)nonSkippableVideoDidFinish;
- (void)nonSkippableVideoDidLoadAd;
- (void)nonSkippableVideoDidFailToLoadAd;
- (void)nonSkippableVideoWillDismiss;
- (void)nonSkippableVideoDidPresent;

@end

@interface RewardedVideoCallbacks : NSObject <AppodealRewardedVideoDelegate> {}

- (void)rewardedVideoDidLoadAd;
- (void)rewardedVideoDidFailToLoadAd;
- (void)rewardedVideoDidPresent;
- (void)rewardedVideoWillDismiss;
- (void)rewardedVideoDidFinish:(NSUInteger)rewardAmount name:(NSString *)rewardName;

@end

const int INTERSTITIAL  		= 3;
const int BANNER       		 	= 4;
const int BANNER_BOTTOM 		= 8;
const int BANNER_TOP    	 	= 16;
const int REWARDED_VIDEO 	 	= 128;
const int NON_SKIPPABLE_VIDEO	= 256;

AppodealUserGender convertIntToGender(int gender) {
    switch (gender) {
        case 0:
            return AppodealUserGenderFemale;
            break;
        case 1:
            return AppodealUserGenderMale;
            break;
        case 2:
            return AppodealUserGenderOther;
            break;
        default:
            return AppodealUserGenderOther;
            break;
    }
}

int nativeAdTypesForType(int adTypes) {
    int nativeAdTypes = 0;
    
    if ((adTypes & INTERSTITIAL) > 0) {
        nativeAdTypes |= AppodealAdTypeInterstitial;
    }
    
    if ((adTypes & REWARDED_VIDEO) > 0) {
        nativeAdTypes |= AppodealAdTypeRewardedVideo;
    }
    
    if ((adTypes & NON_SKIPPABLE_VIDEO) > 0) {
        nativeAdTypes |= AppodealAdTypeNonSkippableVideo;
    }
    
    if ((adTypes & BANNER) > 0 || (adTypes & BANNER_TOP) > 0 || (adTypes & BANNER_BOTTOM) > 0) {
        nativeAdTypes |= AppodealAdTypeBanner;
    }
    
    return nativeAdTypes;
}

int nativeShowStyleForType(int adTypes) {

    if ((adTypes & INTERSTITIAL) > 0) {
        return AppodealShowStyleInterstitial;
    }
    
    if ((adTypes & BANNER_TOP) > 0) {
        return AppodealShowStyleBannerTop;
    }
    
    if ((adTypes & BANNER_BOTTOM) > 0) {
        return AppodealShowStyleBannerBottom;
    }
    
    if ((adTypes & REWARDED_VIDEO) > 0) {
        return AppodealShowStyleRewardedVideo;
    }
    
    if ((adTypes & NON_SKIPPABLE_VIDEO) > 0) {
        return AppodealShowStyleNonSkippableVideo;
    }
    return 0;
}

class  BBBannerCallbacks {
public:
    virtual void onBannerClicked() {}
    virtual void onBannerFailedToLoad() {}
    virtual void onBannerLoaded(int height, BOOL isPrecache) {}
    virtual void onBannerShown() {}
    void mark() {
        BBBannerCallbacks *self=this;
        self->mark();
    }
};

class  BBInterstitialCallbacks {
public:
    virtual void onInterstitialClicked(){}
    virtual void onInterstitialClosed(){}
    virtual void onInterstitialLoaded(BOOL isPrecache){}
    virtual void onInterstitialFailedToLoad(){}
    virtual void onInterstitialShown(){}
    void mark() {
        BBInterstitialCallbacks *self=this;
        self->mark();
    }
};

class  BBNonSkippableVideoCallbacks{
public:
    virtual void onNonSkippableVideoClosed() {}
    virtual void onNonSkippableVideoFailedToLoad() {}
    virtual void onNonSkippableVideoFinished() {}
    virtual void onNonSkippableVideoLoaded() {}
    virtual void onNonSkippableVideoShown() {}
    void mark() {
        BBNonSkippableVideoCallbacks *self=this;
        self->mark();
    }
};

class  BBRewardedVideoCallbacks {
public:
    virtual void onRewardedVideoClosed() {}
    virtual void onRewardedVideoFailedToLoad() {}
    virtual void onRewardedVideoFinished(int amount, String name) {}
    virtual void onRewardedVideoLoaded() {}
    virtual void onRewardedVideoShown() {}
    void mark() {
        BBRewardedVideoCallbacks *self=this;
        self->mark();
    }
};

class BBUserSettings{
private:
public:
    BBUserSettings();
    void setId(String userId);
    void setAge(int age);
    void setGender(int gender);
};

class BBAppodeal{
private:
public:
    
    BBBannerCallbacks *bannerCallbacks;
    BBInterstitialCallbacks *interstitialCallbacks;
    BBNonSkippableVideoCallbacks *nonSkippableVideoCallbacks;
    BBRewardedVideoCallbacks *rewardedVideoCallbacks;
    
    BBAppodeal();
    
    static BBAppodeal *_appodeal;
    static BBAppodeal *GetAppodeal();
    static BBUserSettings *_userSettings;
    static BBUserSettings *GetUserSettings();
    
    virtual void bannerDidLoadAdIsPrecache(BOOL precache);
    virtual void bannerDidFailToLoadAd();
    virtual void bannerDidClick();
    virtual void bannerDidShow();
    
    virtual void interstitialDidLoadAdisPrecache(BOOL precache);
    virtual void interstitialDidClick();
    virtual void interstitialDidDismiss();
    virtual void interstitialWillPresent();
    virtual void interstitialDidFailToLoadAd();
    
    virtual void nonSkippableVideoDidFinish();
    virtual void nonSkippableVideoDidLoadAd();
    virtual void nonSkippableVideoDidFailToLoadAd();
    virtual void nonSkippableVideoWillDismiss();
    virtual void nonSkippableVideoDidPresent();
    
    virtual void rewardedVideoDidLoadAd();
    virtual void rewardedVideoDidFailToLoadAd();
    virtual void rewardedVideoDidPresent();
    virtual void rewardedVideoWillDismiss();
    virtual void rewardedVideoDidFinish(NSUInteger rewardAmount, NSString *rewardName);
    
    void initialize(String _id, int adType);
    bool show(int adType);
    bool show(int adType, String placement);
    void cache(int adType);
    void hide(int adType);
    void confirm(int adType);
    bool isLoaded(int adType);
    bool isPrecache(int adType);
    void setAutoCache(int adType, bool state);
    void disableNetwork(String network);
    void disableNetwork(String network, int adType);
    void disableLocationPermissionCheck();
    void disableWriteExternalStoragePermissionCheck();
    void setTesting(bool state);
    void setLogLevel(String level);
    void setBannerAnimation(bool state);
    void setSmartBanners(bool state);
    void setBannerBackground(bool state);
    void set728x90Banners(bool state);
    void trackInAppPurchase(int amount, String currency);
    
    void showMessage(String meesage);
    
    void setOnLoadedTriggerBoth(int adType, bool state);
    void requestAndroidMPermissions();
    
    void setCustomRule(String name, bool value);
    void setCustomRule(String name, int value);
    void setCustomRule(String name, String value);
    void setCustomRule(String name, float value);
    
    void setBannerCallbacks(BBBannerCallbacks *callbacks);
    void setInterstitialCallbacks(BBInterstitialCallbacks *callbacks);
    void setNonSkippableVideoCallbacks(BBNonSkippableVideoCallbacks *callbacks);
    void setRewardedVideoCallbacks(BBRewardedVideoCallbacks *callbacks);
    
    
};

@implementation BannerCallbacks

- (void)bannerDidLoadAdIsPrecache:(BOOL)precache {
    BBAppodeal::_appodeal->bannerDidLoadAdIsPrecache(precache);
}

- (void)bannerDidRefresh {}

- (void)bannerDidFailToLoadAd {
    BBAppodeal::_appodeal->bannerDidFailToLoadAd();
}

- (void)bannerDidClick {
    BBAppodeal::_appodeal->bannerDidClick();
}

- (void)bannerDidShow {
    BBAppodeal::_appodeal->bannerDidShow();
}

@end

@implementation InterstitialCallbacks

- (void)interstitialDidLoadAdisPrecache:(BOOL)precache {
    BBAppodeal::_appodeal->interstitialDidLoadAdisPrecache(precache);
}

- (void)interstitialDidClick {
    BBAppodeal::_appodeal->interstitialDidClick();
}

- (void)interstitialDidDismiss {
    BBAppodeal::_appodeal->interstitialDidDismiss();
}

- (void)interstitialWillPresent {
    BBAppodeal::_appodeal->interstitialWillPresent();
}

- (void)interstitialDidFailToLoadAd {
    BBAppodeal::_appodeal->interstitialDidFailToLoadAd();
}

@end

@implementation NonSkippableVideoCallbacks

- (void)nonSkippableVideoDidLoadAd {
    BBAppodeal::_appodeal->nonSkippableVideoDidLoadAd();
}

- (void)nonSkippableVideoDidPresent {
    BBAppodeal::_appodeal->nonSkippableVideoDidPresent();
}

- (void)nonSkippableVideoWillDismiss {
    BBAppodeal::_appodeal->nonSkippableVideoWillDismiss();
}

- (void)nonSkippableVideoDidFailToLoadAd {
    BBAppodeal::_appodeal->nonSkippableVideoDidFailToLoadAd();
}

- (void)nonSkippableVideoDidFinish {
    BBAppodeal::_appodeal->nonSkippableVideoDidFinish();
}

@end

@implementation RewardedVideoCallbacks

- (void)rewardedVideoDidFinish:(NSUInteger)rewardAmount name:(NSString *)rewardName {
    BBAppodeal::_appodeal->rewardedVideoDidFinish(rewardAmount, rewardName);
}

- (void)rewardedVideoDidLoadAd {
    BBAppodeal::_appodeal->rewardedVideoDidLoadAd();
}

- (void)rewardedVideoDidPresent {
    BBAppodeal::_appodeal->rewardedVideoDidPresent();
}

- (void)rewardedVideoDidFailToLoadAd {
    BBAppodeal::_appodeal->rewardedVideoDidFailToLoadAd();
}

- (void)rewardedVideoWillDismiss {
    BBAppodeal::_appodeal->rewardedVideoWillDismiss();
}

@end

BBAppodeal *BBAppodeal::_appodeal;
BBAppodeal::BBAppodeal() {}

BBAppodeal *BBAppodeal::GetAppodeal() {
    if(!_appodeal) _appodeal = new BBAppodeal();
    return _appodeal;
}

void BBAppodeal::setBannerCallbacks(BBBannerCallbacks * callbacks) {
    bannerCallbacks = callbacks;
}

void BBAppodeal::setInterstitialCallbacks(BBInterstitialCallbacks *callbacks) {
    interstitialCallbacks = callbacks;
}

void BBAppodeal::setNonSkippableVideoCallbacks(BBNonSkippableVideoCallbacks *callbacks) {
    nonSkippableVideoCallbacks = callbacks;
}

void BBAppodeal::setRewardedVideoCallbacks(BBRewardedVideoCallbacks *callbacks) {
    rewardedVideoCallbacks = callbacks;
}

//banner callbacks
void BBAppodeal::bannerDidShow() {
    bannerCallbacks->onBannerShown();
}

void BBAppodeal::bannerDidClick() {
    bannerCallbacks->onBannerClicked();
}

void BBAppodeal::bannerDidFailToLoadAd() {
    bannerCallbacks->onBannerFailedToLoad();
}

void BBAppodeal::bannerDidLoadAdIsPrecache(BOOL precache) {
    bannerCallbacks->onBannerLoaded(0, precache);
}

//interstitial callbacks
void BBAppodeal::interstitialDidFailToLoadAd() {
    interstitialCallbacks->onInterstitialFailedToLoad();
}

void BBAppodeal::interstitialWillPresent() {
    interstitialCallbacks->onInterstitialShown();
}

void BBAppodeal::interstitialDidDismiss() {
    interstitialCallbacks->onInterstitialClosed();
}

void BBAppodeal::interstitialDidLoadAdisPrecache(BOOL precache) {
    interstitialCallbacks->onInterstitialLoaded(precache);
}

void BBAppodeal::interstitialDidClick() {
    interstitialCallbacks->onInterstitialClicked();
}

//non skippable video callbacks
void BBAppodeal::nonSkippableVideoDidLoadAd() {
    nonSkippableVideoCallbacks->onNonSkippableVideoLoaded();
}

void BBAppodeal::nonSkippableVideoDidFinish() {
    nonSkippableVideoCallbacks->onNonSkippableVideoFinished();
}

void BBAppodeal::nonSkippableVideoDidFailToLoadAd() {
    nonSkippableVideoCallbacks->onNonSkippableVideoFailedToLoad();
}

void BBAppodeal::nonSkippableVideoWillDismiss() {
    nonSkippableVideoCallbacks->onNonSkippableVideoClosed();
}

void BBAppodeal::nonSkippableVideoDidPresent() {
    nonSkippableVideoCallbacks->onNonSkippableVideoShown();
}

//rewarded video callbacks
void BBAppodeal::rewardedVideoDidFinish(NSUInteger rewardAmount, NSString *rewardName) {
    const char *ptr = [rewardName cStringUsingEncoding:NSUTF8StringEncoding];
    rewardedVideoCallbacks->onRewardedVideoFinished((int) rewardAmount, ptr);
}

void BBAppodeal::rewardedVideoDidLoadAd() {
    rewardedVideoCallbacks->onRewardedVideoLoaded();
}

void BBAppodeal::rewardedVideoWillDismiss() {
    rewardedVideoCallbacks->onRewardedVideoClosed();
}

void BBAppodeal::rewardedVideoDidPresent() {
    rewardedVideoCallbacks->onRewardedVideoShown();
}

void BBAppodeal::rewardedVideoDidFailToLoadAd() {
    rewardedVideoCallbacks->onRewardedVideoFailedToLoad();
}

void BBAppodeal::initialize(String _appID, int adType) {
    NSString* appID = _appID.ToNSString();
    [Appodeal setFramework:APDFrameworkMonkeyX];
    [Appodeal initializeWithApiKey:appID types:nativeAdTypesForType(adType)];
    [Appodeal setBannerDelegate:[[BannerCallbacks alloc] init]];
    [Appodeal setInterstitialDelegate:[[InterstitialCallbacks alloc] init]];
    [Appodeal setNonSkippableVideoDelegate:[[NonSkippableVideoCallbacks alloc] init]];
    [Appodeal setRewardedVideoDelegate:[[RewardedVideoCallbacks alloc] init]];
}

bool BBAppodeal::show(int adType) {
    return [Appodeal showAd:nativeShowStyleForType(adType) rootViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
}

bool BBAppodeal::show(int adType, String placement) {
    NSString* placementString = placement.ToNSString();
    return [Appodeal showAd:nativeShowStyleForType(adType) forPlacement:placementString rootViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
}

void BBAppodeal::cache(int adType) {
    [Appodeal cacheAd:nativeShowStyleForType(adType)];
}

void BBAppodeal::hide(int adType) {
    [Appodeal hideBanner];
}

bool BBAppodeal::isLoaded(int adType) {
    return [Appodeal isReadyForShowWithStyle:nativeShowStyleForType(adType)];
}

bool BBAppodeal::isPrecache(int adType) {
    NSLog(@"Appodeal MonkeyX Plugin: isPrecache not supported on iOS SDK, please use callbacks instead");
    return false;
}

void BBAppodeal::setAutoCache(int adType, bool state) {
    [Appodeal setAutocache:state types:nativeAdTypesForType(adType)];
}

void BBAppodeal::disableNetwork(String network) {
    [Appodeal disableNetworkForAdType:AppodealAdTypeBanner name:network.ToNSString()];
    [Appodeal disableNetworkForAdType:AppodealAdTypeInterstitial name:network.ToNSString()];
    [Appodeal disableNetworkForAdType:AppodealAdTypeRewardedVideo name:network.ToNSString()];
}

void BBAppodeal::disableNetwork(String network, int adType) {
    NSString* networkName = network.ToNSString();
    [Appodeal disableNetworkForAdType:nativeShowStyleForType(adType) name:networkName];
}

void BBAppodeal::disableLocationPermissionCheck() {
    [Appodeal setLocationTracking:NO];
}

void BBAppodeal::disableWriteExternalStoragePermissionCheck() {
    NSLog(@"Appodeal MonkeyX Plugin: disableWriteExternalStoragePermissionCheck not supported on iOS SDK");
}

void BBAppodeal::setTesting(bool state) {
    [Appodeal setTestingEnabled:state];
}

void BBAppodeal::setLogLevel(String level) {
    NSString* loglevel = level.ToNSString();
    if ([loglevel isEqualToString:@"verbose"])
        [[APDSdk sharedSdk] setLogLevel:APDLogLevelVerbose];
    if ([loglevel isEqualToString:@"debug"])
        [[APDSdk sharedSdk] setLogLevel:APDLogLevelDebug];
    if ([loglevel isEqualToString:@"none"])
        [[APDSdk sharedSdk] setLogLevel:APDLogLevelOff];
}

void BBAppodeal::setBannerAnimation(bool state) {
    [Appodeal setBannerAnimationEnabled:state];
}

void BBAppodeal::setSmartBanners(bool state) {
    [Appodeal setSmartBannersEnabled:state];
}

void BBAppodeal::setBannerBackground(bool state) {
    [Appodeal setBannerBackgroundVisible:state];
}

void BBAppodeal::set728x90Banners(bool state) {
    NSLog(@"Appodeal MonkeyX Plugin: set728x90Banners not supported on iOS SDK");
}

void BBAppodeal::trackInAppPurchase(int amount, String currency) {
    [[APDSdk sharedSdk] trackInAppPurchase:[NSNumber numberWithInt:amount] currency:currency.ToNSString()];
}

void BBAppodeal::showMessage(String message) {
    NSString* messageInternal = message.ToNSString();
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Testing alert" message:messageInternal delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

void BBAppodeal::setOnLoadedTriggerBoth(int adType, bool state) {
    NSLog(@"Appodeal MonkeyX Plugin: setOnLoadedTriggerBoth not supported on iOS SDK");
}

void BBAppodeal::requestAndroidMPermissions() {
    NSLog(@"Appodeal MonkeyX Plugin: requestAndroidMPermissions not supported on iOS SDK");
}

void BBAppodeal::setCustomRule(String name, bool value) {
    NSString * key = name.ToNSString();
    NSDictionary *tempRule = @{ key: [NSNumber numberWithBool:value] };
    [Appodeal setCustomRule:tempRule];
}

void BBAppodeal::setCustomRule(String name, int value) {
    NSString * key = name.ToNSString();
    NSDictionary *tempRule = @{ key: [NSNumber numberWithInt:value] };
    [Appodeal setCustomRule:tempRule];
}

void BBAppodeal::setCustomRule(String name, String value) {
    NSString * key = name.ToNSString();
    NSString * object = name.ToNSString();
    NSDictionary *tempRule = @{ key: object };
    [Appodeal setCustomRule:tempRule];
}

void BBAppodeal::setCustomRule(String name, float value) {
    NSString * key = name.ToNSString();
    NSDictionary *tempRule = @{ key: [NSNumber numberWithFloat:value] };
    [Appodeal setCustomRule:tempRule];
}

BBUserSettings *BBAppodeal::_userSettings;
BBUserSettings::BBUserSettings() {}
BBUserSettings *BBAppodeal::GetUserSettings() {
    if(!_userSettings) {
        _userSettings = new BBUserSettings();
    }
    return _userSettings;
}

void BBUserSettings::setUserId(String userId) {
    NSString* userIdString = userId.ToNSString();
    [Appodeal setUserId:userIdString];
}

void BBUserSettings::setAge(int age) {
    [Appodeal setUserAge:(NSUInteger)age];
}

void BBUserSettings::setGender(int gender) {
    [Appodeal setUserGender:convertIntToGender(gender)];
}
