abstract class BBInterstitialCallbacks{
	public abstract void onInterstitialClicked();
	public abstract void onInterstitialClosed();
	public abstract void onInterstitialLoaded(boolean isPrecache);
	public abstract void onInterstitialFailedToLoad();
	public abstract void onInterstitialShown();
	public abstract void onInterstitialFinished();
}