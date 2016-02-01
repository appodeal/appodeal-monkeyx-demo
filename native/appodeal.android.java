import com.appodeal.ads.Appodeal;

class BBAppodeal {
	
	static BBAppodeal appodeal;
	Activity activity = BBAndroidGame.AndroidGame().GetActivity();
	
	static public BBAppodeal GetAppodeal(){
		if(appodeal == null) appodeal = new BBAppodeal();
		return appodeal;
	}
	
	public void initialize(String appKey, int adType){
		Appodeal.initialize(activity, appKey, adType);
	}
	
	public boolean show(int adType){
		return Appodeal.show(activity, adType);
	}
	
	public void confirm(int adType){
		Appodeal.confirm(adType);
	}
	
	public boolean showWithPriceFloor(int adType){
		return Appodeal.showWithPriceFloor(activity, adType);
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
	
	public boolean isLoadedWithPriceFloor(int adType){
		return Appodeal.isLoadedWithPriceFloor(adType);
	}
	
	public boolean isPrecache(int adType){
		return Appodeal.isPrecache(adType);
	}
	
	public void setAutoCache(int adType, boolean state){
		Appodeal.setAutoCache(adType, state);
	}
	
	public void setOnLoadedTriggerBoth(int adType, boolean state){
		Appodeal.setOnLoadedTriggerBoth(adType, state);
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
	
	public void setTesting(boolean state){
		Appodeal.setTesting(state);
	}
	
	public void setLogging(boolean state){
		Appodeal.setLogging(state);
	}
	
}