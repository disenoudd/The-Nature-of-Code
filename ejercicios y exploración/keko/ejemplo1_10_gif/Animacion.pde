// Clase para animar una secuencia de GIFs

class Animacion {
  PImage[] imagenes;
  int cuentaImg;
  int frame;

  Animacion(String imagePrefix, int cuenta) {
    cuentaImg = cuenta;
    imagenes = new PImage[cuentaImg];

    for (int i = 0; i < cuentaImg; i++) {
      // Usa nf() para formatear cuántos dígitos tiene numero 'i'
      String archivo = imagePrefix + nf(i+1, 2) + ".png";
      imagenes[i] = loadImage(archivo);
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
    image(imagenes[frame], 0, 0, this.ancho()/4, this.alto()/4);
    popMatrix();
  }

  int ancho() {
    return imagenes[0].width;
  }

  int alto() {
    return imagenes[0].height;
  }
}