HEllipse d;
HRect r;
HPixelColorist colors;

void setup(){
	size(812,900);
	H.init(this).background(#000000);
	smooth();

	colors = new HPixelColorist("kellar.jpg");

	for (int i = 0; i<10000; i++){
		r = new HRect();
		r
			.noStroke()
			.loc( (int)random(width), (int)random(height) )
			.fill( colors.getColor( r.x(), r.y() ), (int)random(5,25) )
			.size( (int)random(25,100) )
			.rotate( (int)random(360) )
			.anchorAt(H.CENTER)
		;
		H.add(r);
	}

	for (int i = 0; i<5000; i++){
		d = new HEllipse();
		d
			.noStroke()
			.loc( (int)random(width), (int)random(height) )
			.fill( colors.getColor( d.x(), d.y() ), (int)random(25,50) )
			.size( (int)random(3,25) )
			.anchorAt(H.CENTER)
		;
		H.add(d);
	}

	H.drawStage();
}
