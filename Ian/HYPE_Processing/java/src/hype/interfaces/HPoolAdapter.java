package hype.interfaces;

import hype.drawable.HDrawable;
import hype.util.HDrawablePool;

public class HPoolAdapter implements HPoolListener {
	@Override
	public void onCreate(HDrawable d, int index, HDrawablePool pool) {}

	@Override
	public void onRequest(HDrawable d, int index, HDrawablePool pool) {}

	@Override
	public void onRelease(HDrawable d, int index, HDrawablePool pool) {}
}
