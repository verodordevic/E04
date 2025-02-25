//Veronika Dordevic
//Pensamiento Algoritmico
//E4:Tiempo


int numParticles = 60; // Número de partículas

void setup() {
  size(400, 400);
  frameRate(1); // Se actualiza una vez por segundo
  noStroke();
}

void draw() {
  background(0);
  int s = second();
  int m = minute();
  int h = hour();
  
  // Generar un color diferente cada minuto con más brillo asegurado
  color baseColor = color((m * 4) % 200 + 55, (m * 6) % 200 + 55, (m * 8) % 200 + 55);
  
  for (int i = 0; i < numParticles; i++) {
    float angle = map(i, 0, numParticles, 0, TWO_PI); // Distribuye las partículas en un círculo
    float radius = map(s, 0, 59, 50, 200); // Ajusta el radio en función de los segundos
    float x = width / 2 + cos(angle) * radius;
    float y = height / 2 + sin(angle) * radius;
    
    fill(baseColor); // Usa el color generado basado en el minuto actual
    ellipse(x, y, 10, 10); // Dibuja las partículas como pequeños círculos
  }
  
  // Representar la hora y minutos en el centro usando una matriz de puntos
  drawNumber(h / 10, width / 2 - 60, height / 2);
  drawNumber(h % 10, width / 2 - 30, height / 2);
  drawNumber(m / 10, width / 2 + 10, height / 2);
  drawNumber(m % 10, width / 2 + 40, height / 2);
}

// Matrices de números hechos con puntos
boolean[][][] numbers = {
  {
    {true, true, true},
    {true, false, true},
    {true, false, true},
    {true, false, true},
    {true, true, true}
  }, // 0
  {
    {false, true, false},
    {true, true, false},
    {false, true, false},
    {false, true, false},
    {true, true, true}
  }, // 1
  {
    {true, true, true},
    {false, false, true},
    {true, true, true},
    {true, false, false},
    {true, true, true}
  }, // 2
  {
    {true, true, true},
    {false, false, true},
    {true, true, true},
    {false, false, true},
    {true, true, true}
  }, // 3
  {
    {true, false, true},
    {true, false, true},
    {true, true, true},
    {false, false, true},
    {false, false, true}
  }, // 4
  {
    {true, true, true},
    {true, false, false},
    {true, true, true},
    {false, false, true},
    {true, true, true}
  }, // 5
  {
    {true, true, true},
    {true, false, false},
    {true, true, true},
    {true, false, true},
    {true, true, true}
  }, // 6
  {
    {true, true, true},
    {false, false, true},
    {false, true, false},
    {false, true, false},
    {false, true, false}
  }, // 7
  {
    {true, true, true},
    {true, false, true},
    {true, true, true},
    {true, false, true},
    {true, true, true}
  }, // 8
  {
    {true, true, true},
    {true, false, true},
    {true, true, true},
    {false, false, true},
    {true, true, true}
  }  // 9
};

// Dibuja un número usando la matriz de puntos
void drawNumber(int num, float x, float y) {
  int dotSize = 5;
  int spacing = 10;
  fill(255);
  for (int row = 0; row < 5; row++) {
    for (int col = 0; col < 3; col++) {
      if (numbers[num][row][col]) {
        ellipse(x + col * spacing, y + row * spacing, dotSize, dotSize);
      }
    }
  }
}
