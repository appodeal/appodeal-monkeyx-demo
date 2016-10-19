abstract class BBRewardedVideoCallbacks{
	public abstract void onRewardedVideoClosed(boolean finished);
	public abstract void onRewardedVideoFailedToLoad();
	public abstract void onRewardedVideoFinished(int amount, String name);
	public abstract void onRewardedVideoLoaded();
	public abstract void onRewardedVideoShown();
}