// Clase para animar una secuencia de GIFs

class Animacion {
  PImage[] imagenes;
  PImage[] tmpImg;
  int cuentaImg;
  int frame;
  color c = color(random(100, 255), random(100, 255), random(100, 255), 200);

  Animacion(String imagePrefix, int cuenta) {
    cuentaImg = cuenta;
    imagenes = new PImage[cuentaImg];

    /*
    for (int i = 0; i < cuentaImg; i++) {
      // Usa nf() para formatear cuántos dígitos tiene numero 'i'
      String archivo = imagePrefix + nf(i+1, 2) + ".png";
      imagenes[i] = loadImage(archivo);
    }
    */

    if (random(1)>0.7) {
      imagenes[0] = loadImage(imagePrefix + nf(0+1, 2) + ".png");
      imagenes[1] = loadImage(imagePrefix + nf(1+1, 2) + ".png");
      imagenes[2] = loadImage(imagePrefix + nf(2+1, 2) + ".png");
      imagenes[3] = loadImage(imagePrefix + nf(3+1, 2) + ".png");
    } else if (random(1)>0.4){
      imagenes[0] = loadImage(imagePrefix + nf(1+1, 2) + ".png");
      imagenes[1] = loadImage(imagePrefix + nf(2+1, 2) + ".png");
      imagenes[2] = loadImage(imagePrefix + nf(3+1, 2) + ".png");
      imagenes[3] = loadImage(imagePrefix + nf(0+1, 2) + ".png");
    } else {
      imagenes[0] = loadImage(imagePrefix + nf(2+1, 2) + ".png");
      imagenes[1] = loadImage(imagePrefix + nf(3+1, 2) + ".png");
      imagenes[2] = loadImage(imagePrefix + nf(0+1, 2) + ".png");
      imagenes[3] = loadImage(imagePrefix + nf(1+1, 2) + ".png");
    }
  }

  void mostrar(float posX, float posY, float espejarX, float espejarY) {
    pushMatrix();
    translate(posX-30, posY);

    int dirX = (espejarX>0) ? -1 : 1;
    int dirY = (espejarY>0) ? -1 : 1;
    //println(dir + " " + espejarX);
    scale(dirX, dirY);
    frame = (frame+1) % cuentaImg;
    tint(c);  // Tint random color
    image(imagenes[frame], 0, 0, this.ancho()/6, this.alto()/6);
    popMatrix();
  }

  int ancho() {
    return imagenes[0].width;
  }

  int alto() {
    return imagenes[0].height;
  }
}