/*
 Ejemplo 1.11: Arreglo de caminantes acelerando hacia el mouse
 The Nature of Code por Nathan Shiffman
 http://github.com/shiffman/the-Nature-of-Code
 
 La Naturaleza del Código
 traducido por Sergio Majluf, Nicolás Troncoso
 y estudiantes de Diseño UDD
 http://github.com/disenoudd/the-Nature-of-Code
 
 MODS:
 Llevamos clase Caminante a su propio archivo
 Agregamos clase Animacion
 Mostrarmos un GIF animado en el lugar de la ellipse
 https://processing.org/examples/animatedsprite.html
 */

// Declarar objeto caminante
Caminante[] caminantes = new Caminante[20];
PImage hibisco;
PImage pradera;

void setup() {
  size(800, 600);
  for (int i=0; i< caminantes.length; i++) {
    caminantes[i] = new Caminante();
  }
  //frameRate(15);
  hibisco = loadImage("hibisco.png");
  
  
  pradera = loadImage("pradera.jpg");
}
void draw() {
  background(255);
  noTint();
  imageMode(CORNER);
  image(pradera, 0,0, width, height);
  //imageMode(CENTER);
  //image(hibisco, mouseX,mouseY);
  

  for (int i = 0; i < caminantes.length; i++) {
    //{!3} Calling functions on all the objects in the array
    caminantes[i].actualizar();
    caminantes[i].revisarBordes();
    caminantes[i].mostrar();
  }
  
  text("Usa 'a/A' separar las partículas/mariposas", 20, height-60);
  text("Usa 'f/F' para alternar entre ellipse y figura", 20, height-40);
}

void keyPressed() {
  if (key == 'a' || key == 'A') {
    for (int i = 0; i < caminantes.length; i++) {
      caminantes[i].acelera();
    }
  } else if (key == 'f' || key == 'F') {
    for (int i = 0; i < caminantes.length; i++) {
      caminantes[i].toggle();
    }
  }
}