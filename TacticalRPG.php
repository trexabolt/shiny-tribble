<?php
class Character {
    public $name, $hp, $attack;
    function __construct($n, $h, $a) {
        $this->name = $n;
        $this->hp = $h;
        $this->attack = $a;
    }
    function strike($other) {
        $other->hp -= $this->attack;
        echo "$this->name attacks $other->name for $this->attack damage!\n";
    }
}

class RPGGame {
    public $chars = [];
    function addChar($n, $h, $a) {
        $this->chars[] = new Character($n, $h, $a);
    }
    function battle() {
        $a = $this->chars[0];
        $b = $this->chars[1];
        $a->strike($b);
        $b->strike($a);
    }
    function showStatus() {
        foreach ($this->chars as $c)
            echo "$c->name HP: $c->hp\n";
    }
}

$game = new RPGGame();
$game->addChar("Hero", 50, 12);
$game->addChar("Monster", 40, 10);
for ($i=0;$i<5;$i++) {
    $game->battle();
    $game->showStatus();
}
echo "Tactical RPG Ended.\n";
?>