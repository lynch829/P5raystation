/*
 * HYPE_Processing
 * http:
 * 
 * Copyright (c) 2013 Joshua Davis & James Cruz
 * 
 * Distributed under the BSD License. See LICENSE.txt for details.
 * 
 * All rights reserved.
 */
public static abstract class HDrawable3D extends HDrawable {
	public static final float DEFAULT_DEPTH = 100; 
	protected float _depth;
	protected float _anchorW;
	public HDrawable3D() {
		_depth = DEFAULT_DEPTH;
	}
	public HDrawable3D size(float s) {
		return size(s,s,s);
	}
	public HDrawable3D size(float w, float h, float d) {
		_width = w;
		_height = h;
		_depth = d;
		return this;
	}
	public PVector size() {
		return new PVector(_width,_height,_depth);
	}
	public HDrawable3D depth(float f) {
		_depth = f;
		return this;
	}
	public float depth() {
		return _depth;
	}
	public HDrawable3D scale(float s) {
		return scale(s,s,s);
	}
	public HDrawable3D scale(float sw, float sh, float sd) {
		return (HDrawable3D) depth(sd).scale(sw,sh);
	}
	public HDrawable3D anchor(float ancx, float ancy, float ancz) {
		return (HDrawable3D) anchorZ(ancz).anchorX(ancx).anchorY(ancy);
	}
	public HDrawable3D anchorAt(int where) {
		if( (where & HConstants.CENTER_X) != 0 ) {
			anchorU(0.5f);
		} else if( (where & HConstants.LEFT) != 0 ) {
			anchorU(0);
		} else if( (where & HConstants.RIGHT) !=  0 ) {
			anchorU(1);
		}
		if( (where & HConstants.CENTER_Y) != 0 ) {
			anchorV(0.5f);
		} else if( (where & HConstants.TOP) != 0 ) {
			anchorV(0);
		} else if( (where & HConstants.BOTTOM) !=  0 ) {
			anchorV(1);
		}
		if( (where & HConstants.CENTER_Z) != 0 ) {
			anchorW(0.5f);
		} else if( (where & HConstants.BACK) != 0 ) {
			anchorW(0);
		} else if( (where & HConstants.FRONT) !=  0 ) {
			anchorW(1);
		}
		return this;
	}
	protected void onResize(float oldW, float oldH, float newW, float newH) {
		super.onResize(oldW, oldH, newW, newH);
	}
	public PVector anchor() {
		return new PVector(anchorX(), anchorY(), anchorZ());
	}
	public PVector anchorUV() {
		return new PVector(_anchorU, _anchorV, _anchorW);
	}
	public HDrawable3D anchorZ(float f) {
		return anchorZ(z2w(f));
	}
	public float anchorZ() {
		return w2z(_anchorW);
	}
	public HDrawable3D anchorW(float f) {
		_anchorW = f;
		return this;
	}
	public float anchorW() {
		return _anchorW;
	}
	public float z2w(float px) {
		return px / (_depth==0? DEFAULT_DEPTH : _depth);
	}
	public float w2z(float pc) {
		return pc * _depth;
	}
}
