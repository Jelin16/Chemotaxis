Bacteria[] colony;
boolean collisionDetected = false;
color rectColor;
PFont font;
boolean gameOver = false;

void setup() {
  size(600, 600);
  colony = new Bacteria[100];
  rectColor = color(255);
  font = createFont("Arial", 32);
  textFont(font);
  textAlign(CENTER, CENTER);

  for (int i = 0; i < colony.length; i++) {
    colony[i] = new Bacteria();
  }
}

void draw() {
  if (!collisionDetected) {
    background(0);
  } else {
    background(255);
    fill(0); // Text color
    text("YOU LOSE", width / 2, height / 2);
    gameOver = true; // Set the game over flag
  }
  
  fill(rectColor);
  rect(mouseX, mouseY, 20, 20);
  
  for (int i = 0; i < colony.length; i++) {
    colony[i].move();
    colony[i].show();
    colony[i].followMouse();
    
    if (!gameOver) {
      if (colony[i].collidesWithRect(mouseX, mouseY, 20, 20)) {
        collisionDetected = true;
        rectColor = color(0);
      }
    }
  }
}

class Bacteria {
  int myX, myY;

  Bacteria() {
    myX = myY = 300;
  }

  void move() {
    myX = myX + (int)(Math.random() * 7) - 3;
    myY = myY + (int)(Math.random() * 7) - 3;
  }

  void show() {
    fill((int)(Math.random() * 256), (int)(Math.random() * 256), (int)(Math.random() * 256));
    ellipse(myX, myY, 20, 20);
  }

  void followMouse() {
    int dx = mouseX - myX;
    int dy = mouseY - myY;
    int stepX = (int)(Math.random() * 5) - 1;
    int stepY = (int)(Math.random() * 5) - 1;

    if (dx > 0) {
      myX += stepX;
    } else {
      myX -= stepX;
    }

    if (dy > 0) {
      myY += stepY;
    } else {
      myY -= stepY;
    }
  }
  
  boolean collidesWithRect(int rectX, int rectY, int rectWidth, int rectHeight) {
    float d = dist(myX, myY, rectX + rectWidth / 2, rectY + rectHeight / 2);
    return d < 20 + max(rectWidth, rectHeight) / 2;
  }
}
