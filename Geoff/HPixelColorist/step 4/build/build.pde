HEllipse d1, d2, d3;
HRect d4;
HPixelColorist colors;

void setup(){
	size(812,900);
	H.init(this).background(#000000);
	smooth();

	colors = new HPixelColorist("kellar.jpg");

	for (int i = 0; i<10000; i++){
		d1 = new HEllipse();
		d1
			.noStroke()
			.loc( (int)random(width), (int)random(height) )
			.fill( colors.getColor( d1.x(), d1.y() ), (int)random(5,25) )
			.size( (int)random(25,100) )
			.anchorAt(H.CENTER)
		;
		H.add(d1);
	}

	for (int i = 0; i<50000; i++){
		d2 = new HEllipse();
		d2
			.noStroke()
			.loc( (int)random(width), (int)random(height) )
			.fill( #FFFFFF, (int)random(0,2) )
			.size( (int)random(1,30) )
			.anchorAt(H.CENTER)
		;
		H.add(d2);
	}	

	for (int i = 0; i<5000; i++){
		d3 = new HEllipse();
		d3
			.noStroke()
			.loc( (int)random(width), (int)random(height) )
			.fill( colors.getColor( d3.x(), d3.y() ), (int)random(25,50) )
			.size( (int)random(3,25) )
			.anchorAt(H.CENTER)
		;
		H.add(d3);
	}

	for (int i = 0; i<20000; i++){
		d4 = new HRect();
		d4
			.noStroke()
			.loc( (int)random(width), (int)random(height) )
			.fill( colors.getColor( d4.x(), d4.y() ), (int)random(15,25) )
			.size( 5 )
			.rotate( (int)random(360) )
			.anchorAt(H.CENTER)
		;
		H.add(d4);
	}	

	H.drawStage();
}
