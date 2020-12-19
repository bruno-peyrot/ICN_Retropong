/*
      PONG
      par B. PEYROT
      décembre 2016
      Lycée Elisée Reclus de Sainte Foy La Grande
      pour le cours d'I.C.N.
*/


// Déclaration des variables
int x, y, dx, dy ,oldx, oldy;
int xgauche, ygauche, oldxgauche, oldygauche;
int xdroite, ydroite, oldxdroite, oldydroite;

void setup() {
  // Initialisations
  oldx = 40;
  oldy = 270;
  x = 40;
  y = 270;
  dx = 4;
  dy = 4;
  oldxgauche = 20;
  oldygauche = 230;
  xgauche = 20;
  ygauche = 230;
  oldxdroite = 760;
  oldydroite = 230;
  xdroite = 760;
  ydroite = 230;
  size(800,550);
  background(0);
  noStroke();
}

void draw() {
  // Efface les positions précédentes de la balle et des raquettes
  fill(0);
  rect(oldx, oldy, 20, 20);
  rect(oldxgauche, oldygauche, 20, 80);
  rect(oldxdroite, oldydroite, 20, 80);
  // récupère le fond des nouvelles positions de la balle et des raquettes
  oldx = x;
  oldy = y;
  oldxgauche = xgauche;
  oldygauche = ygauche;
  oldxdroite = xdroite;
  oldydroite = ydroite;
  // Affiche la balle et les raquettes
  fill(255);
  rect(x, y, 20, 20);
  rect(xgauche, ygauche, 20, 80);
  rect(xdroite, ydroite, 20, 80);
  // Déplacement de la balle
  x = x + dx;
  y = y + dy;
  // Le joueur rouge a marqué le point ?
  if (x >= 780) {
    delay(1000);
    dx = -dx;
    x = xdroite - 20;
    y = ydroite + 40;
  }
  // Le joueur bleu a marqué le point ?
  if (x < 0) {
    delay(1000);
    dx = -dx;
    x = xgauche + 20;
    y = ygauche + 40;
  }
  // Rebond éventuel de la balle sur le haut ou le bas du terrain
  if ((y >= 530)||(y <= 0)) {
    dy = -dy;
  }
  // Déplacement de la raquette de gauche (joueur humain)
  if (keyPressed) {
    if (key == CODED) {
      // La touche 'flèche vers le haut' permet de monter...
      if ((keyCode == UP) && (ygauche > 4)) { ygauche = ygauche - 4;}
      // ... la touche 'flèche vers le bas' de descendre
      if ((keyCode == DOWN) && (ygauche < 466)) {ygauche = ygauche + 4;}
    }
  }
  // Déplacement de la raquette de droite (ordinateur)
  if ((y < ydroite + 5) && (ydroite > 5) && (x >= 500) && (dx > 0)) {ydroite = ydroite - 4;}
  if ((y > ydroite + 75) && (ydroite < 465) && (x >= 500) && (dx > 0)) {ydroite = ydroite + 4;}
  if ((x < 200) && (ydroite > 275)) {ydroite--;}
  if ((x < 200) && (ydroite < 275)) {ydroite++;}
  // Gestion des rebonds de la balle sur les raquettes
  // Raquette du joueur
  if ((x == xgauche + 20) && (y > ygauche - 4) && (y < ygauche + 84) && (dx < 0)) {
    dx = -dx;
  }
  // Raquette de l'ordinateur
  if ((x == xdroite - 20) && (y > ydroite - 2) && (y < ydroite + 82) && (dx > 0)) {
    dx = -dx;
  }
}