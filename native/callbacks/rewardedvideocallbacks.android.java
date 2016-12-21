abstract class BBRewardedVideoCallbacks{
	public abstract void onRewardedVideoClosed();
	public abstract void onRewardedVideoFailedToLoad();
	public abstract void onRewardedVideoFinished(int amount, String name);
	public abstract void onRewardedVideoLoaded();
	public abstract void onRewardedVideoShown();
}