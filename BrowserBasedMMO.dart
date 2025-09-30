class Player {
  String name;
  int x, y;
  Player(this.name, this.x, this.y);
}

class MMOGame {
  List<Player> players = [];
  void addPlayer(String name) {
    players.add(Player(name, 0, 0));
  }
  void movePlayer(String name, int dx, int dy) {
    for (var p in players) {
      if (p.name == name) {
        p.x += dx;
        p.y += dy;
      }
    }
  }
  void showPlayers() {
    for (var p in players) {
      print("${p.name} at (${p.x},${p.y})");
    }
  }
}

void main() {
  var game = MMOGame();
  game.addPlayer("Hero");
  game.addPlayer("Villain");
  for (var i = 0; i < 5; i++) {
    game.movePlayer("Hero", 1, 1);
    game.movePlayer("Villain", -1, -1);
    game.showPlayers();
  }
  print("Browser MMO Ended.");
}