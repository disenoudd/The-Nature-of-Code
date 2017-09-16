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

  void mostrar(float posX, float posY) {
    pushMatrix();
      translate(-40, -30);
      frame = (frame+1) % cuentaImg;
      image(imagenes[frame], posX, posY, this.ancho()/4,this.alto()/4);
    popMatrix();
  }

  int ancho() {
    return imagenes[0].width;
  }
  
  int alto() {
    return imagenes[0].height;
  }
}