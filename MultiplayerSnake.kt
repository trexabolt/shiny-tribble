data class Snake(val name: String, var pos: Pair<Int, Int>, var alive: Boolean = true)

class SnakeGame {
    val snakes = mutableListOf<Snake>()
    val size = 5
    val food = Pair(2, 2)
    fun addSnake(name: String) {
        snakes.add(Snake(name, Pair(0,0)))
    }
    fun moveSnake(idx: Int, dx: Int, dy: Int) {
        val s = snakes[idx]
        if (s.alive) {
            val nx = s.pos.first + dx
            val ny = s.pos.second + dy
            if (nx in 0 until size && ny in 0 until size) {
                s.pos = Pair(nx, ny)
                if (s.pos == food) println("${s.name} ate food!")
            } else {
                s.alive = false
            }
        }
    }
    fun printState() {
        for (s in snakes) println("${s.name}: ${s.pos} Alive: ${s.alive}")
    }
}

fun main() {
    val game = SnakeGame()
    game.addSnake("One")
    game.addSnake("Two")
    for (i in 0..4) {
        game.moveSnake(0, 1, 0)
        game.moveSnake(1, 0, 1)
        game.printState()
    }
    println("Multiplayer Snake Ended.")
}