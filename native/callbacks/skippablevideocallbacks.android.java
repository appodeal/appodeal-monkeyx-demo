abstract class BBSkippableVideoCallbacks{
	public abstract void onSkippableVideoClosed(boolean finished);
	public abstract void onSkippableVideoFailedToLoad();
	public abstract void onSkippableVideoFinished();
	public abstract void onSkippableVideoLoaded();
	public abstract void onSkippableVideoShown();
}