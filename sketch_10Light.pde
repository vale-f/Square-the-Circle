size(500, 400, P3D); 
int concentration = 400;
background(0); 
noStroke(); 
spotLight(255, 255, 255, 200, 200, 1600, 
          0, 0, -1, PI/16, concentration); 
translate(320, 200, 0); 
sphere(140);
save("light2.tif");
