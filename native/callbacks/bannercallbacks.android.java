abstract class BBBannerCallbacks{
	public abstract void onBannerClicked();
	public abstract void onBannerFailedToLoad();
	public abstract void onBannerLoaded(boolean isPrecache);
	public abstract void onBannerShown();
}