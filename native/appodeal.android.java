import android.app.Activity;
import android.widget.Toast;

import com.appodeal.ads.Appodeal;
import com.appodeal.ads.BannerCallbacks;
import com.appodeal.ads.InterstitialCallbacks;
import com.appodeal.ads.NonSkippableVideoCallbacks;
import com.appodeal.ads.RewardedVideoCallbacks;

class BBAppodeal implements BannerCallbacks, InterstitialCallbacks, NonSkippableVideoCallbacks, RewardedVideoCallbacks {
	
	static BBAppodeal appodeal;
	private BBUserSettings userSettings;
	private BBBannerCallbacks bannerCallbacks;
	private BBInterstitialCallbacks interstitialCallbacks;
	private BBNonSkippableVideoCallbacks nonSkippableCallbacks;
	private BBRewardedVideoCallbacks rewardedCallbacks;
	
	Activity activity = BBAndroidGame.AndroidGame().GetActivity();
	
	static public BBAppodeal GetAppodeal(){
		if(appodeal == null) appodeal = new BBAppodeal();
		return appodeal;
	}
	
	public void initialize(String appKey, int adType){
		Appodeal.disableNetwork(activity, "cheetah");
		Appodeal.setBannerCallbacks(this);
		Appodeal.setInterstitialCallbacks(this);
		Appodeal.setNonSkippableVideoCallbacks(this);
		Appodeal.setRewardedVideoCallbacks(this);
		Appodeal.initialize(activity, appKey, adType);
	}
	
	public boolean show(int adType){
		return Appodeal.show(activity, adType);
	}
	
	public boolean show(int adType, String placement){
		return Appodeal.show(activity, adType, placement);
	}
	
	public void cache(int adType){
		Appodeal.cache(activity, adType);
	}
	
	public void hide(int adType){
		Appodeal.hide(activity, adType);
	}
	
	public boolean isLoaded(int adType){
		return Appodeal.isLoaded(adType);
	}
	
	public boolean isPrecache(int adType){
		return Appodeal.isPrecache(adType);
	}
	
	public void setAutoCache(int adType, boolean state){
		Appodeal.setAutoCache(adType, state);
	}
	
	public void setOnLoadedTriggerBoth(int adType, boolean state){
		Appodeal.setTriggerOnLoadedOnPrecache(adType, state);
	}
	
	public void disableNetwork(String network){
		Appodeal.disableNetwork(activity, network);
	}
	
	public void disableNetwork(String network, int adType){
		Appodeal.disableNetwork(activity, network, adType);
	}
	
	public void disableLocationPermissionCheck(){
		Appodeal.disableLocationPermissionCheck();
	}
	
	public void disableWriteExternalStoragePermissionCheck(){
		Appodeal.disableWriteExternalStoragePermissionCheck();
	}
	
	public void setCustomRule(String name, boolean value){
		Appodeal.setCustomRule(name, value);
	}
	
	public void setCustomRule(String name, int value){
		Appodeal.setCustomRule(name, value);
	}
	
	public void setCustomRule(String name, double value){
		Appodeal.setCustomRule(name, value);
	}
	
	public void setCustomRule(String name, String value){
		Appodeal.setCustomRule(name, value);
	}
	
	public void setTesting(boolean state){
		Appodeal.setTesting(state);
	}
	
	public void setLogLevel(String level){
		Appodeal.setLogLevel(com.appodeal.ads.utils.Log.LogLevel.valueOf(level));
	}
	
	public void requestAndroidMPermissions(){
		Appodeal.requestAndroidMPermissions(activity, null);
	}
	
	public void set728x90Banners(boolean flag){
		Appodeal.set728x90Banners(flag);
	}
	
	public void setBannerAnimation(boolean flag){
		Appodeal.setBannerAnimation(flag);
	}
	
	public void setSmartBanners(boolean flag){
		Appodeal.setSmartBanners(flag);
	}
	
	public void setSmartBackground(boolean flag){
		
	}
	
	public void trackInAppPurchase(double amount, String currency) {
        Appodeal.trackInAppPurchase(activity, amount, currency);
    }
	
	public BBUserSettings GetUserSettings(){
		if(userSettings == null){
			userSettings = new BBUserSettings(Appodeal.getUserSettings(activity));
		}
		return userSettings;
	}
	
	public void setBannerCallbacks(BBBannerCallbacks callbacks){
		bannerCallbacks = callbacks;
	}
	
	public void setInterstitialCallbacks(BBInterstitialCallbacks callbacks){
		interstitialCallbacks = callbacks;
	}
	
	public void setRewardedVideoCallbacks(BBRewardedVideoCallbacks callbacks){
		rewardedCallbacks = callbacks;
	}
	
	public void setNonSkippableVideoCallbacks(BBNonSkippableVideoCallbacks callbacks){
		nonSkippableCallbacks = callbacks;
	}
	
	@Override
	public void onBannerClicked() {
		if(bannerCallbacks != null)
			bannerCallbacks.onBannerClicked();
	}

	@Override
	public void onBannerFailedToLoad() {
		if(bannerCallbacks != null)
			bannerCallbacks.onBannerFailedToLoad();
	}

	@Override
	public void onBannerLoaded(int height, boolean isPrecache) {
		if(bannerCallbacks != null)
			bannerCallbacks.onBannerLoaded(height, isPrecache);
	}

	@Override
	public void onBannerShown() {
		if(bannerCallbacks != null)
			bannerCallbacks.onBannerShown();
	}
	
	@Override
	public void onInterstitialClicked() {
		if(interstitialCallbacks != null)
			interstitialCallbacks.onInterstitialClicked();
	}

	@Override
	public void onInterstitialClosed() {
		if(interstitialCallbacks != null)
			interstitialCallbacks.onInterstitialClosed();
	}

	@Override
	public void onInterstitialFailedToLoad() {
		if(interstitialCallbacks != null)
			interstitialCallbacks.onInterstitialFailedToLoad();
	}

	@Override
	public void onInterstitialLoaded(boolean isPrecache) {
		if(interstitialCallbacks != null)
			interstitialCallbacks.onInterstitialLoaded(isPrecache);
	}

	@Override
	public void onInterstitialShown() {
		if(interstitialCallbacks != null)
			interstitialCallbacks.onInterstitialShown();
	}
	
	@Override
	public void onNonSkippableVideoClosed(boolean finished) {
		if(nonSkippableCallbacks != null)
			nonSkippableCallbacks.onNonSkippableVideoClosed();
	}

	@Override
	public void onNonSkippableVideoFailedToLoad() {
		if(nonSkippableCallbacks != null)
			nonSkippableCallbacks.onNonSkippableVideoFailedToLoad();
	}

	@Override
	public void onNonSkippableVideoFinished() {
		if(nonSkippableCallbacks != null)
			nonSkippableCallbacks.onNonSkippableVideoFinished();
	}

	@Override
	public void onNonSkippableVideoLoaded() {
		if(nonSkippableCallbacks != null)
			nonSkippableCallbacks.onNonSkippableVideoLoaded();
	}

	@Override
	public void onNonSkippableVideoShown() {
		if(nonSkippableCallbacks != null)
			nonSkippableCallbacks.onNonSkippableVideoShown();
	}
	
	@Override
	public void onRewardedVideoClosed(boolean finished) {
		if(rewardedCallbacks != null)
			rewardedCallbacks.onRewardedVideoClosed();
	}

	@Override
	public void onRewardedVideoFailedToLoad() {
		if(rewardedCallbacks != null)
			rewardedCallbacks.onRewardedVideoFailedToLoad();
	}

	@Override
	public void onRewardedVideoFinished(int amount, String name) {
		if(rewardedCallbacks != null)
			rewardedCallbacks.onRewardedVideoFinished(amount, name);
	}

	@Override
	public void onRewardedVideoLoaded() {
		if(rewardedCallbacks != null)
			rewardedCallbacks.onRewardedVideoLoaded();
	}

	@Override
	public void onRewardedVideoShown() {
		if(rewardedCallbacks != null)
			rewardedCallbacks.onRewardedVideoShown();
	}
	
	public void showMessage(String msg){
		Toast.makeText(activity, msg, Toast.LENGTH_SHORT).show();
	}
	
}