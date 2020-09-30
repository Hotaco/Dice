int total;
int highscore;
boolean pressed = false;

void setup()
{
  noLoop();
  size(800, 800);
}

void draw()
{
  background(0);
  
  for (int y = 90; y <= 800; y+=80)
  {
    for (int x = 10; x <= 800; x+=80)
    {
      Die myDie = new Die(x, y, 60);
      myDie.roll();
      myDie.show();
    }
  }
  drawScore();
  total = 0;
}

void mousePressed()
{
  redraw();
  noLoop();
}

void drawScore()
{
  stroke(255);
  fill(255);
  textSize(20);
  text("Total is: "+total, 365, 20);
  text("Highest total: "+highscore, 365, 50);
}


class Die //models one single dice cube
{
  int myX, myY;
  int mySize;
  int side;

  Die(int x, int y, int size) //constructor
  {
    myX = x;
    myY = y;
    mySize = size;
  }
  void roll()
  {
    side = ((int)(Math.random()*6)+1);
    total += side;
    if (total > highscore)
    {
      highscore = total;
    }
  }

  void drawBase()
  {
    noStroke();
    int r = ((int)(Math.random()*255));
    int g = ((int)(Math.random()*255));
    int b = ((int)(Math.random()*255));
    fill(r, g, b);
    rect(myX+5, myY-5, mySize, mySize, 5);
    rect(myX-5, myY+5, mySize, mySize, 5);
    fill(255, 250, 250);
    rect(myX, myY, mySize, mySize, 5);
  }

  void show()
  {
    int dotSize = 12;

    switch(side)
    {
    case 1:
      drawBase();
      fill(0);
      ellipse(myX+(mySize/2), myY+(mySize/2), dotSize, dotSize);
      break;

    case 2:
      drawBase();
      fill(0);
      ellipse(myX+(mySize*0.25), myY+(mySize*0.25), dotSize, dotSize);
      ellipse(myX+(mySize*0.75), myY+(mySize*0.75), dotSize, dotSize);
      break;

    case 3:
      drawBase();
      fill(0);
      ellipse(myX+(mySize/2), myY+(mySize/2), dotSize, dotSize);
      ellipse(myX+(mySize*0.25), myY+(mySize*0.25), dotSize, dotSize);
      ellipse(myX+(mySize*0.75), myY+(mySize*0.75), dotSize, dotSize);
      break;

    case 4:
      drawBase();
      fill(0);
      ellipse(myX+(mySize*0.25), myY+(mySize*0.25), dotSize, dotSize);
      ellipse(myX+(mySize*0.75), myY+(mySize*0.25), dotSize, dotSize);
      ellipse(myX+(mySize*0.75), myY+(mySize*0.75), dotSize, dotSize);
      ellipse(myX+(mySize*0.25), myY+(mySize*0.75), dotSize, dotSize);
      break;

    case 5:
      drawBase();
      fill(0);
      ellipse(myX+(mySize*0.25), myY+(mySize*0.25), dotSize, dotSize);
      ellipse(myX+(mySize/2), myY+(mySize/2), dotSize, dotSize);
      ellipse(myX+(mySize*0.75), myY+(mySize*0.75), dotSize, dotSize);
      ellipse(myX+(mySize*0.25), myY+(mySize*0.75), dotSize, dotSize);
      ellipse(myX+(mySize*0.75), myY+(mySize*0.25), dotSize, dotSize);
      break;

    case 6:
      drawBase();
      fill(0);
      ellipse(myX+(mySize*0.25), myY+(mySize*0.25), dotSize, dotSize);
      ellipse(myX+(mySize*0.75), myY+(mySize*0.25), dotSize, dotSize);
      ellipse(myX+(mySize*0.75), myY+(mySize*0.75), dotSize, dotSize);
      ellipse(myX+(mySize*0.25), myY+(mySize*0.75), dotSize, dotSize);
      ellipse(myX+(mySize*0.25), myY+(mySize/2), dotSize, dotSize);
      ellipse(myX+(mySize*0.75), myY+(mySize/2), dotSize, dotSize);
      break;
    }
  }
}
