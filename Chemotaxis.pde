// Define a class to represent a single organism (e.g., bacteria)
class Bacteria {
  constructor() {
    this.x = 0; // Initial x-coordinate
    this.y = 0; // Initial y-coordinate
    this.color = Math.floor(Math.random() * 255); // Random color value (0-255)
  }

  move() {
    // Move the organism in a random walk pattern
    const stepSize = 1;
    const dx = (Math.random() - 0.5) * stepSize;
    const dy = (Math.random() - 0.5) * stepSize;
    this.x += dx;
    this.y += dy;
  }

  show() {
    // Draw the organism on the screen using the three member variables
    fill(this.color, 100, 100); // You can use HSL color representation
    ellipse(this.x, this.y, 10, 10); // Adjust size and shape as needed
  }
}

// Create an array to store many instances of the Bacteria class
const numOrganisms = 100; // Number of organisms
const organisms = [];

function setup() {
  createCanvas(400, 400);
  colorMode(HSL, 255);
  for (let i = 0; i < numOrganisms; i++) {
    organisms.push(new Bacteria());
  }
}

function draw() {
  background(220);

  for (let organism of organisms) {
    organism.move();
    organism.show();
  }
}
