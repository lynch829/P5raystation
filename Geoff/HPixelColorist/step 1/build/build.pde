HRect d;
HPixelColorist colors;

void setup(){
	size(600,874);
	H.init(this).background(#202020);
	smooth();

	colors = new HPixelColorist("kellar.jpg");

	for (int i = 0; i<500000; i++){
		d = new HRect();
		d
			.loc( (int)random(width), (int)random(height) )
			// .strokeWeight(3)
			// .stroke( colors.getColor( d.x(), d.y() ) )
			.fill( colors.getColor( d.x(), d.y() ), 100 )
			.size( (int)random(5,5) )
			.rotate( (int)random(360) )
			.anchorAt(H.CENTER)
		;
		H.add(d);
	}

	H.drawStage();
}
