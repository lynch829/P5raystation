public static class HEllipse extends HDrawable {
	protected int _mode;
	protected float _startRad, _endRad;
	public HEllipse() {
		_mode = PConstants.PIE;
	}
	public HEllipse(float ellipseRadius) {
		this();
		radius(ellipseRadius);
	}
	public HEllipse(float radiusX, float radiusY) {
		radius(radiusX,radiusY);
	}
	public HEllipse createCopy() {
		HEllipse copy = new HEllipse();
		copy.copyPropertiesFrom(this);
		return copy;
	}
	public HEllipse radius(float r) {
		size(r*2);
		return this;
	}
	public HEllipse radius(float radiusX, float radiusY) {
		size(radiusX*2,radiusY*2);
		return this;
	}
	public HEllipse radiusX(float radiusX) {
		width(radiusX * 2);
		return this;
	}
	public float radiusX() {
		return _width/2;
	}
	public HEllipse radiusY(float radiusY) {
		height(radiusY * 2);
		return this;
	}
	public float radiusY() {
		return _height/2;
	}
	public boolean isCircle() {
		return _width == _height;
	}
	public HEllipse mode(int t) {
		_mode = t;
		return this;
	}
	public float mode() {
		return _mode;
	}
	public HEllipse start(float deg) {
		return startRad(deg * H.D2R);
	}
	public float start() {
		return _startRad * H.R2D;
	}
	public HEllipse startRad(float rad) {
		_startRad = rad;
		return this;
	}
	public float startRad() {
		return _startRad;
	}
	public HEllipse end(float deg) {
		return endRad(deg * H.D2R);
	}
	public float end() {
		return _endRad * H.R2D;
	}
	public HEllipse endRad(float rad) {
		_endRad = rad;
		return this;
	}
	public float endRad() {
		return _endRad;
	}
	public boolean containsRel(float relX, float relY) {
		float cx = _width/2;
		float cy = _height/2;
		float dcx = relX - cx;
		float dcy = relY - cy;
		boolean b = ((dcx*dcx)/(cx*cx) + (dcy*dcy)/(cy*cy) <= 1);
		if(_startRad == _endRad) {
			return b;
		}
		float f = H.app().atan2(dcy, dcx);
		switch(_mode) {
		case PConstants.CHORD:
		case PConstants.OPEN:
			return b;
		default:
			return b && _startRad <= f && f <= _endRad;
		}
	}
	public void draw(PApplet app,float drawX,float drawY,float currAlphaPerc) {
		applyStyle(app,currAlphaPerc);
		drawX += _width/2;
		drawY += _height/2;
		if(_startRad == _endRad) {
			app.ellipse(drawX, drawY, _width, _height);
		} else {
			app.arc(drawX,drawY,_width,_height,_startRad,_endRad,_mode);
		}
	}
}
